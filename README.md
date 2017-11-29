# dotfiles
我在 Linux 下使用的 dotfiles，包括 shell 的配置和 vim 的配置。

## 注意事项

- 最好是在新建用户后立即使用。原 `~/.bashrc` 会被本项目的 `.bashrc` 覆盖。如果以前在 `~/.bashrc` 中定义过环境变量或其他设置，可以到 `~/.backup` 目录中手动将原来的的相应设置拷贝到新的 `~/.shell/shared_env` 中即可。新建用户立即执行 dotfiles 就没有这些问题，所以推荐新建用户后立即执行 dotfiles。
- 当使用 Ubuntu 时，确保 `apt-get install vim` 安装 vim。其他系统如 RedHat/CentOS/Federa/Debian 等均未发现异常。
- 项目中包含了一些 Python 脚本（`~/.shell/svn-color.py`），请使用 Python 2.x 版本。

## 使用方法

```
$ git clone https://github.com/morgengc/dotfiles.git
$ cd dotfiles
$ /bin/bash install.sh
```
退出当前 shell 后重新打开 shell 即可生效。

## bash效果图

![image](https://github.com/morgengc/dotfiles/blob/master/image/bash.png)

## vim效果图

![image](https://github.com/morgengc/dotfiles/blob/master/image/vim.png)

