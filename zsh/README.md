
# Instalação do Zsh + Oh My Zsh + plugins

> Testado no **Ubuntu 24.04**

### 1 - Atualizar sistema e instalar dependências

```bash
sudo apt update
sudo apt install -y zsh curl git
```

### 2 - Definir o Zsh como shell padrão

```bash
chsh -s "$(which zsh)"
```

### 3 -  Instalar o Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Quando o script perguntar algo, pode confirmar com `enter` ou `y`.

### 5 - Criar diretório de plugins customizados

```bash
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
mkdir -p "$ZSH_CUSTOM"
```

### 6 - Instalar plugins do Zsh (um por um)

#### zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
"$ZSH_CUSTOM/zsh-autosuggestions"
```

#### zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
"$ZSH_CUSTOM/zsh-syntax-highlighting"
```

#### fast-syntax-highlighting

```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting \
"$ZSH_CUSTOM/fast-syntax-highlighting"
```

#### zsh-autocomplete

```bash
git clone https://github.com/marlonrichert/zsh-autocomplete \
"$ZSH_CUSTOM/zsh-autocomplete"
```

### 7 - Configurar o `.zshrc` para ativar os plugins lá
```bash
sed -i '/^plugins=/c\plugins=(\n  git\n  zsh-autosuggestions\n  zsh-syntax-highlighting\n  fast-syntax-highlighting\n  zsh-autocomplete\n)' ~/.zshrc
```

### 8 - Mude o tema ZSH padrão
```bash
sed -i '/^ZSH_THEME=/c\ZSH_THEME="crcandy"' ~/.zshrc
```

Você pode encontrar muitos outros themas [aqui](https://github.com/ohmyzsh/ohmyzsh/wiki/themes), basta apenas mudar o nome do tema no arquivo .zsh, na linha que define o tema: `ZSH_THEME`

### 9 - Recarregar o Zsh

```bash
exec zsh
```

## Observações importantes

Você pode guardar seu arquivo .zshrc com suas configurações, alias, etc. E substituir por esse padrão que vem. Mas é importante lembrar de deixar seus plugins configurados no arquivo .zshrc