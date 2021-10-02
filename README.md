```bash
mkdir -p ~/workspace/find-node
cp ~/private-net/genesis.json ~/workspace/find-node
```

```bash
mkdir -p ~/workspace/find-node/bootnode \
~/workspace/find-node/test-geth1 \
~/workspace/find-node/test-geth2
```

```bash
touch ~/workspace/find-node/bootnode/bootnode.log \
~/workspace/find-node/test-geth1/geth.log \
~/workspace/find-node/test-geth2/geth.log
```

```bash
cd find-node/bootnode
bootnode --genkey boot.key
cat boot.key
bootnode --nodekey ~/workspace/find-node/bootnode/boot.key \
--verbosity 9 2>> ~/workspace/find-node/bootnode/bootnode.log
```

enode 주소 복사

```bash
ifconfig | grep netmask
```

```bash
bootnode --nodekey ~/workspace/find-node/bootnode/boot.key \
--verbosity 9 2>> ~/workspace/find-node/bootnode/bootnode.log \
--addr 192.168.0.12:30301
```

```bash
cd ~/workspace/find-node/
geth --datadir ~/workspace/find-node/test-geth1 init genesis.json
```

```bash
geth --datadir ~/workspace/find-node/test-geth1 --networkid 100 \
--port 30323 console 2>> ~/workspace/find-node/test-geth1/geth.log

personal.newAccount()
```

test-geth2에도 같은 방식으로 계정 생성

ip주소 복사

접속

```bash
geth --datadir ~/workspace/find-node/test-geth1 --networkid 100 \
--port 30323 --bootnodes \
"enode://a0950c712a94f13219e152db20812bb146f11243f67cc0263252f0df477725cc7fdfa0e7e4cbfdd82b498d48c8318279c04f645e8ec99e043748f9a54ea5565a@192.168.0.12:0?discport=30301" \
--verbosity 6 console 2>> ~/workspace/find-node/test-geth1/geth.log
```

```bash
geth --datadir ~/workspace/find-node/test-geth2 --networkid 100 \
--port 30333 --bootnodes \
"enode://a0950c712a94f13219e152db20812bb146f11243f67cc0263252f0df477725cc7fdfa0e7e4cbfdd82b498d48c8318279c04f645e8ec99e043748f9a54ea5565a@192.168.0.12:0?discport=30301" \
--verbosity 6 console 2>> ~/workspace/find-node/test-geth2/geth.log
```
