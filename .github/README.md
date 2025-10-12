> [!IMPORTANT]
> 本人是colemak键位用户

某些插件需要安装特定的软件才能正常使用，如果是arch用户可以使用`paru`或者`yay`安装，示例如下

```bash
paru -S neovim python-neovim python-pip npm
# 如果使用kitty，则不需要安装下面的ueberzugpp等软件(用于图像预览)
paru -S lua51 imagemagick luarocks ueberzugpp
sudo luarocks --lua-version=5.1 install magick
# deno用于markdown预览，支持火狐和chrome，webkit2gtk-4.1可选
paru -S deno webkit2gtk-4.1
# translate-shell用于翻译，我配置的翻译快捷键是tr和ts
paru -S translate-shell
# 也在终端使用`trans -e bing :zh "hello world"`指定bing引擎翻译文本
```

![效果](效果.jpg) 
