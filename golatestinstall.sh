# 必要なツールをインストール
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y git gcc

# go1.4.3をダウンロード、解凍、削除
# apt install -y wget
# wget https://storage.googleapis.com/golang/go1.4.3.linux-amd64.tar.gz
# mkdir $HOME/go1.4
# tar xzf go1.4.3.linux-amd64.tar.gz -C $HOME/go1.4 --strip-components 1
# rm go1.4.3.linux-amd64.tar.gz

# go1.4.3をダウンロード、ビルド、インストール
# デフォルト GOROOT_BOOTSTRAP="$HOME/go1.4"
git clone -b go1.4.3 https://go.googlesource.com/go go1.4
cd go1.4/src
export CGO_ENABLED=0
./make.bash
export CGO_ENABLED=1
cd ../..
sudo mv go1.4 $HOME

# go最新版ダウンロード、ビルド、インストール
git clone https://go.googlesource.com/go
cd go/src
./make.bash
cd ../..
sudo mv go /usr/local/

# 環境変数を設定
echo "
export GOROOT=/usr/local/go
export PATH=\$PATH:\$GOROOT/bin
export GOPATH=\$HOME/Projects/go
export PATH=\$PATH:\$GOPATH/bin
" >> ~/.bashrc
