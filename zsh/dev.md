# Ambiente ubuntu no docker para teste do terminal ZSH

Este passo-a-passo configura o abiente de teste para testar o terminal ZSH, instalando e configurando o `Oh My Zsh` e plugins essenciais.

1. Rode o ambiente de teste
```bash
docker run --rm -it ubuntu:24.04 bash
  ```

2. Script para instalar o ZSH:
```bash
apt update
apt install -y zsh curl git

chsh -s "$(which zsh)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
mkdir -p "$ZSH_CUSTOM"

git clone https://github.com/zsh-users/zsh-autosuggestions \
  "$ZSH_CUSTOM/zsh-autosuggestions"

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  "$ZSH_CUSTOM/zsh-syntax-highlighting"

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting \
  "$ZSH_CUSTOM/fast-syntax-highlighting"

git clone https://github.com/marlonrichert/zsh-autocomplete \
  "$ZSH_CUSTOM/zsh-autocomplete"

sed -i '/^plugins=/c\plugins=(\n  git\n  zsh-autosuggestions\n  zsh-syntax-highlighting\n  fast-syntax-highlighting\n  zsh-autocomplete\n)' ~/.zshrc

sed -i '/^ZSH_THEME=/c\ZSH_THEME="crcandy"' ~/.zshrc
```


3. Finalize reiniciando o terminal:
```bash
exit
```

4. E em seguida:
```bash
exec zsh
```
