Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install -y cascadia-code-nerd-font
choco install -y cmder
choco install -y fvim
choco install -y glow
choco install -y notepadplusplus.install
choco install -y visualstudio2022enterprise
choco install -y everything
choco install -y pasteboard

if (!(Test-Path ~\AppData\Local\nvim))
{
    md ~\AppData\Local\nvim\autoload
}
else
{
    write-host "Autload Folder already exists"
}

$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
    $uri,
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
        "~\AppData\Local\nvim\autoload\plug.vim"
    )
)

if (!(Test-Path ~\AppData\Local\nvim))
{
    New-Item -itemType Directory -Path ~\AppData\Local -Name nvim
}
else
{
    write-host "Nvim Folder already exists"
}

Copy-Item -Force dotfiles/.cmder.xml -Destination \tools\Cmder\vendor\conemu-maximus5\ConEmu.xml
Copy-Item -Force dotfiles/.user_aliases.cmd -Destination \tools\Cmder\config\user_aliases.cmd
Copy-Item -Force dotfiles/.user_profile.cmd -Destination \tools\Cmder\config\user_profile.cmd
Copy-Item -Force dotfiles/.init.vim -Destination ~\AppData\Local\nvim\init.vim
Copy-Item -Force dotfiles/.vssettings -Destination \tools\Cmder\config\.vssettings
Copy-Item -Force dotfiles/.gitconfig -Destination ~\.gitconfig
