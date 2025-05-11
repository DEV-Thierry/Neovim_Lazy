# Configuração de Ambiente de Desenvolvimento com LazyVim, Neovim, Tmux e Debugger C# no WSL

Este guia cobre a instalação e configuração do Neovim com LazyVim, integração com Tmux, Lazygit e suporte a depuração C# utilizando o `netcoredbg` no Ubuntu (via WSL).

---

## ✅ Requisitos Iniciais

* Ubuntu instalado no WSL (Windows Subsystem for Linux)
* Git instalado
* Conexão com a internet

---

## ⚙️ Instalação do Neovim

```bash
sudo apt update
sudo apt install cmake

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.11.0

make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

---

## 🚀 Instalar LazyVim

```bash
cd ~
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```

### Dependências adicionais

```bash
sudo apt install unzip
```

---

## 📦 Instalar Node.js (via NVM)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

Reinicie o terminal e depois:

```bash
nvm install --lts
```

---

## 🧱 Instalar .NET SDK (C#)

```bash
sudo add-apt-repository ppa:dotnet/backports
sudo apt-get update
sudo apt-get install -y dotnet-sdk-9.0
```

---

## 💠 Instalar Lazygit

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
```

---

## 🧰 Preparar Debugger para C# (netcoredbg)

```bash
sudo apt install -y cmake clang g++ make

git clone https://github.com/Samsung/netcoredbg.git
cd netcoredbg
mkdir build && cd build

CC=clang CXX=clang++ cmake ..
make
sudo make install
```

### Adicionar ao PATH

Adicione ao final do `~/.bashrc`:

```bash
export PATH="$PATH:/usr/local"
```

Depois, recarregue:

```bash
source ~/.bashrc
```

Verifique:

```bash
netcoredbg --version
```

---

## 📅 Configuração do Tmux

### Alias para abrir layout de IDE

No `~/.bashrc`:

```bash
alias ide='tmux split-window -v -l "30%" \; split-window -h -l "50%"'
```

### Configurações iniciais

No `~/.tmux.conf`:

```tmux
set-option -g prefix M-c
unbind C-b
bind M-c send-prefix

bind -n C-h select-pane -L
bind -n C-j select-pane -D
bind -n C-k select-pane -U
bind -n C-l select-pane -R

bind -n M-a previous-window
bind -n M-f next-window
```

---

## 📦 Plugins do Tmux

### Instalar TPM

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Adicione no final do `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'dracula/tmux'

set -g @dracula-show-powerline true
set -g @dracula-fixed-location "São Paulo"
set -g @dracula-plugins "weather"
set -g @dracula-show-flags true
set -g @dracula-show-left-icon session
set -g @dracula-show-fahrenheit false

run '~/.tmux/plugins/tpm/tpm'
```

Depois, abra o Tmux e pressione: `prefix + I` para instalar os plugins.

---

## 📋 Suporte a Clipboard no WSL (win32yank)

```bash
mkdir -p ~/.local/bin
cd ~/.local/bin
curl -sLo win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip win32yank.zip
chmod +x win32yank.exe
```

Adicione ao `~/.bashrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Recarregue:

```bash
source ~/.bashrc
```

---

## 🔑 Keymap para copiar com <leader>y no Neovim

Adicione no seu `init.lua`:

```lua
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
```

Agora é possível copiar com `"+y` ou `<leader>y`.

---

## ✅ Pronto!

Seu ambiente de desenvolvimento com Neovim + LazyVim + Tmux + Debugger C# está configurado e pronto para uso no WSL.

---

### Autor

Configuração por Thierry.
