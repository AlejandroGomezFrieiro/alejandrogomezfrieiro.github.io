---
title: Codecompanion and how I tested LLMs in Neovim
tags: [blog]
---

With all the recent news about AI, agents and LLMs, it is hard to not feel tempted to, at the very least, learn more about the world of modern AI.

There has been a few reasons for me to do so, some of which I cannot really get into detail here. But I have been quite interesed in how LLM agents are aiding the automation of scientific and engineering progress.

Take, for example, [Agent Laboratory](https://agentlaboratory.github.io/), which attempts to fully automate the process of research all the way to the end, where a written report is finished. Of course, many of these tools are experimental and still early proofs-of-concept. But it is interesting to think that, in the future, we might be able to interact with scientific equipment fully through natural language, and allow them to interact with code environmnts directly.

> [!NOTE]
> The ethical and environmental issues of LLMs are still not solved as well, but I think people in STEM fields should not easily ignore a new technology for this reason only. Many technologies are developed that have similar issues, but technical advances and ethical regulations improve upon them.

> [!WARNING]
> I am not advocating, as well, for using LLMs to replace artists or any real human touch. There's too much AI-generated content polluting the Internet to, what I believe, is an unhealthy degree. In fact, Shumailov et al.[^2] already reported last year that training them on their own data causes the model to collapse into gibberish, so at some point I hope the AI hype machine stops posting AI-generated articles, videos and images. The only possible way I see LLMs working at this point (and any point in the future) succesfully is in a [human-in-the-loop](https://en.wikipedia.org/wiki/Human-in-the-loop) fashion as a way to **enhance** the human workflow, not replace it.

As a [[neovim]] user, my first concern (as always) was to figure out a way to setup some coding environment where I could test some of the free LLMs. I tried in the past to setup [[running_ollama_in_nixos|ollama]] to a mixed degree of success, but services such as [Openrouter](https://openrouter.ai/) provide limited free access to LLM models through their API, and so that was a perfect place to start.

## Setting up codecompanion

[codecompanion.nvim](https://codecompanion.olimorris.dev/) is a tool that seems to really integrate very well within the editor experience of neovim. Not only does it provide a "chat" window to directly interact with the model, but you can also interact with visual selections and buffers. Setting it up in my [[nixvim]] setup was not that hard at first, since nixvim does support codecompanion.

Until I realized that its `nixpkgs` version is not always kept up to date. The solution was to setup a specific version, and since codecompanion is, once again, already setup within nixvim all I had to do is enable it and modify the underlying package to use a more recent one. You can find the configuration in [my repository](https://github.com/AlejandroGomezFrieiro/nixvim_config/blob/main/config/codecompanion.nix) to check how I set it up.

```nix
{...}:
let
    codecompanion = pkgs.fetchFromGitHub {
        owner = "olimorris";
        repo = "codecompanion.nvim";
        rev = "e7aaef6134aa9d47e214427464867c5afc4f34fe";
        hash = "sha256-wSK7JrWkvuFtl7kFVeW2SIw9GLD0/ijsw7FGN11el1A=";
  };
in {
    plugins.codecompanion.package = codecompanion;
    
    # Extra configuration here.
}
```

## Codecompanion usage

Now comes the kind of not so great result, sadly. All of this technology is still under heavy development, so not everything works out of the box. I wanted to test some of the [deepseek](https://openrouter.ai/deepseek/deepseek-chat-v3-0324:free) models with some of the tools that are included.

> [!NOTE]
> Tools are just a way for LLMs to interact with code in a structured way. Model Context Protocol (MCP) is an example of an standard for LLMs to use tools.


Sadly the reasons why tools did not work properly are, at this moment, beyond my expertise. It might be that not all models are capable of function calling yet. This could be a problem in the future if regulation is not properly setup, as I fear it might be the case that private companies might impose restrictions on tool usage based on how much users are willing to pay for them. As always, self-hosting is probably the way to go if one wants full control, but hosting LLMs is still on the expensive side due to their hardware requirements.

I am still conservatively positive that `codecompanion` will likely be the tool I would use with `neovim`. I also would not want to change my whole workflow and be forced to use external tools such as [Zed AI](https://zed.dev/ai) or [Cursor](https://www.cursor.com/) for this purpose...

## Trying with popular models

Since the `openrouter` + `deepseek` setup did not really amount to much at this point, I decided to get some free `OpenAI` key for the sole purpose of testing my configuration. And, to my suprise, it did work as expected. For example, I managed to use one of the tools in `codecompanion`, `@cmd_runner_tool`, to allow the LLM to run `ls` in the directory. Of course, ***UNDER STRICT SUPERVISION AND MANUALLY ACCEPTING ALL COMMANDS***.

And it worked!

The LLM succesfully printed out a list of the files in the directory.

...how exciting, eh? So much work just for that?

Dear reader, I am not going to lie to you. As a scientist and engineer I am both as curious as I am somewhat skeptical that LLM tools are, at this point, of any real use to me. Between the limited amount of free services, my own desire to not spend any money on them and the fact that you have to babysit them so much to do things that might take seconds...

And the recent article by Kosmyna et al.[^1] talking about how there could be a direct impact of the wrong use of LLMs in academic essay writing makes me wonder if it's a worthwhile endeavor to continue exploring them during my private time. Multi-agent workflows sound interesting, but their long-term usage in a scientific context is unclear. If I keep looking into it during my private time, it might be as support while trying to develop some hobbyist coding project (or refactoring my nix configs to be more modular, if the model is capable of doing things properly).

[^1]: https://www.media.mit.edu/publications/your-brain-on-chatgpt/
[^2]: [Shumailov, Ilia, et al. "AI models collapse when trained on recursively generated data." Nature 631.8022 (2024): 755-759.](https://www.nature.com/articles/s41586-024-07566-y)
