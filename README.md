# 💬 Generate hashtags

Generate a hashtags list with the text in the current buffer using the repeated words


## 📦 Installation

Install the plugin with your preferred package manager:

### [Lazy](https://github.com/folke/lazy.nvim)

```lua
-- Lua
{
	"pablotrianda/generate-hastags",
	config = true,
	opts = {
		notAllowedWords = {
			"como",
			"cómo",
			"la",
			"donde",
			"dónde",
			"por",
			"porque",
			"no",
			"si",
			"es",
			"esto",
			"así",
			"```"
		}
	}
}
```

## ⚙️ Configuration

```lua
opts = {
    notAllowedWords = {
        "como",
        "cómo",
        "la",
        "donde",
        "dónde",
        "por",
        "porque",
        "no",
        "si",
        "es",
        "esto",
        "así",
        "```"
    }
}
```

## 🚀 Usage

Run the following command:

```sh
:GenerateHashtags
```




