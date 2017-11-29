# dotfiles
我在 Linux 下使用的 dotfiles。包括 shell 的配置和 vim 的配置。`dotfiles.zip` 是本项目中所有配置文件打包而成。

## 注意事项

- 最好是在新建用户后立即使用。
- 当使用 Ubuntu 时，确保 `apt-get install vim` 安装 vim。其他系统如 RedHat/CentOS/Federa/Debian 等均未发现异常。
- 项目中包含了一些 Python 脚本，请使用 Python 2.x 版本。

## 使用方法

```
$ cd ~
$ ./backup_dotfiles.sh
$ wget --no-check-certificate https://raw.githubusercontent.com/morgengc/dotfiles/master/dotfiles.zip
$ unzip dotfiles.zip (Input `A` to select "ALL")
$ rm backup_dotfiles.sh
```
退出当前 shell 后重新打开 shell 即可生效。

**注意**：此时 `.bashrc` 已经被本项目的 `.bashrc` 覆盖了。如果以前在 `.bashrc` 中定义过环境变量或其他设置，可以到 `.backup` 目录中手动将原来的的相应设置拷贝到新的 `.bashrc` 中即可。新建用户立即执行 dotfiles 就没有这些问题，所以推荐新建用户后立即执行 dotfiles。

## bash效果图

![image](https://github.com/morgengc/dotfiles/blob/master/doc/bash.png)

## vim效果图

![image](https://github.com/morgengc/dotfiles/blob/master/doc/vim.png)

