local Config = require("generate-hashtags.config")
local P = {}

-- Concatena a list
local concatenate = function(hashtags_array)
	local result = ""

	for i, element in ipairs(hashtags_array) do
		result = result .. element

		if i < #hashtags_array then
			result = result .. " "
		end
	end

	return result
end

-- Find an element on a list
local findEl = function(list, el)
	if list == nil then
		return false
	end

	for _, e in ipairs(list) do
		if e == el then
			return true
		end
	end

	return false
end

-- Remove not allowed Words
local cleanAllWord = function(allWords)
	local notAllowedWords = Config.options.notAllowedWords
	local cleanedList = {}
	for _, el in ipairs(allWords) do
		if not findEl(notAllowedWords, el) then
			table.insert(cleanedList, string.format("#%s", el))
		end
	end

	return cleanedList
end

-- Find the repeated words
local repeatedKeywords = function(lines)
	local allWords = {}
	for _, line in ipairs(lines) do
		for word in line:gmatch("%S+") do
			if word ~= " " then
				table.insert(allWords, string.lower(word))
			end
		end
	end

	local allowedWords = cleanAllWord(allWords)

	local frecuency = {}
	for _, el in ipairs(allowedWords) do
		if not frecuency[el] then
			frecuency[el] = 1
		else
			frecuency[el] = frecuency[el] + 1
		end
	end

	local duplicatedWords = {}
	for elemento, count in pairs(frecuency) do
		if count > 1 then
			table.insert(duplicatedWords, elemento)
		end
	end

	return concatenate(duplicatedWords)
end

local getTitle = function(title)
	-- Dividir la cadena en palabras
	local words = {}
	for word in title:gmatch("%S+") do
		table.insert(words, word)
	end

	-- Capitalize the first words and set like CammelCase
	local result = ""
	for i, word in ipairs(words) do
		if i == 1 then
			result = result .. word
		else
			result = result .. word:gsub("^%l", string.upper)
		end
	end

	return result
end

P.getHastags = function(lines)
	local hashtags = {}
	-- Title
	local title = getTitle(lines[1])
	table.insert(hashtags, title)

	-- Repeated keywords
	table.insert(hashtags, repeatedKeywords(lines))

	return concatenate(hashtags)
end

return P
