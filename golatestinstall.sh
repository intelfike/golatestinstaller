# 必要なツールをインストール
apt-get update -y
apt-get upgrade -y
apt-get install -y wget git gcc

# go1.4.3をダウンロード、解凍、削除
wget https://storage.googleapis.com/golang/go1.4.3.linux-amd64.tar.gz
tar -C $HOME/ -xzf go1.4.3.linux-amd64.tar.gz
rm go1.4.3.linux-amd64.tar.gz
# 環境変数を設定
echo "export GOROOT_BOOTSTRAP=$HOME/go1.4" >> ~/.bashrc
source ~/.bashrc

# go最新版ダウンロード
git clone https://go.googlesource.com/go
cd ./go/src/
sh all.bash
cd ../..
mv go /usr/local/
# 環境変数を設定
echo "
export GOROOT=/usr/local/go
export PATH=\$PATH:\$GOROOT/bin
export GOPATH=\$HOME/Project/go
export PATH=\$PATH:\$GOPATH/bin
" >> ~/.bashrc