
# ICON Workshop @ DevStamp 2018

ICON의 Smart Contract (SCORE) 개발툴인 T-Bears를 활용하여 SCORE를 개발하고, Local network 및 Testnet(여의도)으로 deploy 합니다.
실습에 사용할 T-Bears 개발툴과 실습 예제 파일은 Docker Image 로 배포됩니다. 

## Prerequisite 

Docker가 설치되어 있어야 합니다. https://hub.docker.com/search/?type=edition&offering=community


## Build docker image and run the container 
 
### 1. Github 로부터 빌드하는 방법 
#### docker build 를 통해, icon tag를 단 이미지를 빌드합니다. 

```
$ git clone https://github.com/nanaones/icon_score_dev_workshop

$ cd icon_score_dev_workshop 

$ docker build --tag icon .  
```

#### docker run 을 통해, 빌드된 이미지를 실행시킵니다. 
``` 
$ docker run -it -p 9000:9000 icon  
```

### 2. 로컬서버에서 icon.tar 파일을 다운로드 받아 실행하는 방법 
인터넷 연결이 원할하지 않은 경우, local file server 에서 tar file 을 다운로드 받아 빌드할 수 있습니다. 
- ftp://192.168.0.1:21
- With SSID : icon

```
$ docker load --input icon.tar    

$ docker run -it -p 9000:9000 icon  
```

 
### 3. dockercloud에도 이미지가 업로드 되어있습니다.
빌드와 실행을 아래 명령어로 한 번에 할 수 있습니다.
``` 
$ docker run -it -p 9000:9000 nanaones/icon:0.3
``` 

### 4. 실습시간에는 추첨하는 SCORE의 빈칸을 채워봅니다.
https://github.com/nanaones/GoodsEvent
- ``` /goods_event ``` 안에는 다같이 빈칸을 채워볼 코드가 있습니다.
- ``` /goods_event_ref_impl ``` 안에는 빈칸으로 만들기 이전의 코드가 있습니다.

### Requirement Description

1. The operator can start or stop the event.
2. Participants can not participate in the event after the event stopped.
3. The operator can change the event status from stop to start.
4. Participants participate in the event by submitting a message, message should be a number within certain range.
5. Paticipants can submit a message multiple times, and the message is updated with the latest submission. Multiple submittion does not increase the chance of win.
6. A winner is selected each time the designated function is called, and the result should be appended to the list. There must be a way to list up the winner list.

상세한 내용 참조 : https://github.com/nanaones/GoodsEvent#requirement-description

## docker 이미지를 실행하면, `/home` 안에 아래와 같은 파일트리가 존재합니다. 

``` 
/home
.
|-- 01_Local
|   |-- 01_init
|   |   |-- 00_1_set_tbears_cli_config
|   |   |-- 00_2_deploy_project
|   |   |-- 00_3_use_call
|   |   |-- 01_deploy.sh
|   |   |-- 02_call.sh
|   |   |-- 03_tbears_cli_config.json
|   |   `-- project
|   |       |-- __init__.py
|   |       |-- package.json
|   |       `-- project.py
|   `-- 02_Show_me_the_money
|       |-- 00_1_set_tbears_cli_config
|       |-- 00_2_Deploy_Show_me_the_money
|       |-- 01_sendtx.sh
|       |-- 02_tbears_cli_config.json
|       `-- Show_me_the_money
|           |-- Show_me_the_money.py
|           |-- __init__.py
|           `-- package.json
|-- 02_Testnet
|   |-- 01_init
|   |   |-- 00_1_set_tbears_cli_config
|   |   |-- 00_2_deploy_project
|   |   |-- 00_3_use_call
|   |   |-- 01_deploy.sh
|   |   |-- 02_call.sh
|   |   |-- 03_tbears_cli_config.json
|   |   `-- project
|   |       |-- __init__.py
|   |       |-- package.json
|   |       `-- project.py
|   `-- 02_Show_me_the_money
|       |-- 00_1_set_tbears_cli_config
|       |-- 00_2_Deploy_Show_me_the_money
|       |-- 01_sendtx.sh
|       |-- 02_tbears_cli_config.json
|       `-- Show_me_the_money
|           |-- Show_me_the_money.py
|           |-- __init__.py
|           `-- package.json
|-- Appendix_link.md
`-- GoodsEvent
    |-- README.KR.md
    |-- README.md
    |-- goods_event
    |   |-- __init__.py
    |   |-- goods_event.py
    |   `-- package.json
    |-- goods_event_original
    |   |-- __init__.py
    |   |-- goods_event.py
    |   `-- package.json
    `-- goods_event_tests
        |-- goods_event_call_check_event_state.json
        |-- goods_event_call_check_join_message.json
        |-- goods_event_call_count_join_user.json
        |-- goods_event_call_show_event_winner.json
        |-- goods_event_send_event_start.json
        |-- goods_event_send_event_stop.json
        |-- goods_event_send_join_event.json
        `-- goods_event_send_raffle.json 

```



## 내용살펴보기 

### 01_Local 디렉토리

* T-Bears 만을 사용하여 Local Network에 SCORE 를 deploy(배포)합니다.
* Local Network에 배포한 SCORE를 향하여 상태변화가 일어나지 않는 SCORE에 대한 함수를 호출하는 call, 송금과 같은 상태를 변화시키는 트랜잭션을 발생시키는 sendtx 명령을 실행하고, 결과를 확인합니다. 

### 02_Testnet 디렉토리

* T-Bears 를 활용하여, Testnet(여의도)에 SCORE 를 deploy(배포)합니다. 
* Local Network에 배포한 SCORE를 향하여 상태변화가 일어나지 않는 SCORE에 대한 함수를 호출하는 call, 송금과 같은 상태를 변화시키는 트랜잭션을 발생시키는 sendtx 명령을 실행하고, 결과를 확인합니다. 

### 01_init 디렉토리

``` tbears init <project> <SCORE class> ``` 명령어를 통해 생성되는 기본 SCORE인 ``` project ``` 폴더와 생성된 SCORE를 deploy(배포)하기 위한 shell script인 ``` 01_deploy.sh``` 와, 배포된 SCORE를 call 하기 위한  ``` 02_call.sh``` shell script가 포함되어있습니다.


##### ``` 01_deploy.sh```
- 01_init 디렉토리 아래에 있는 project폴더를 deploy 합니다.
- 03_tbears_cli_config.json 의 설정을 적용합니다.
- "-k " 옵션을 통해 sign을 하기 때문에, keystore파일이 필요합니다.

##### ``` 02_call.sh```
- ``` 01_deploy.sh```를 통해서 deploy(배포)한 SCORE의 readonly 메소드를 call 해 줍니다.
- call 하기 위해서 필요한 옵션들을 ``` call.json``` 이라는 파일로 저장합니다. 
- 실행한 결과를 출력합니다.

##### ``` 03_tbears_cli_config.json ```
- T-Bears 를 활용하여 트랜잭션을 만들어 낼 때 사용되는 커스터마이징 옵션입니다.
- URI 는 ``` 01_Local ``` 에서는 Local 으로, ``` 02_Testnet ``` 에서는 Testnet(여의도)로 설정되어있습니다. 
- stepLimit( 수수료 )을 설정합니다.

### 02_Show_me_the_money 디렉토리
* T-Bears 를 활용하여, Test Network(여의도)에 SCORE 를 deploy(배포)합니다.
* ``` 01_Local ``` 에서는 Local 으로, ``` 02_Testnet ``` 에서는 Testnet(여의도)로 설정되어있습니다. 
* Local Network에 배포한 SCORE를 향하여 상태를 변화시키는 트랜잭션을 발생시키는 sendtx 명령을 실행하고, 결과를 확인합니다. 

##### ``` 01_sendtx.sh ```

- deploy(배포)된 SCORE 에 ICX를 송금하는 트랜잭션을 발생시킵니다.
- 결과를 출력해줍니다. 
- 만들어진 트랜잭션 요청에 사용된 json 파일을 ``` sendtx.json ``` 으로 현 위치에 저장합니다.
- "-k " 옵션을 통해 sign을 하기 때문에, keystore파일이 필요합니다.


##### ``` 02_tbears_cli_config.json ```
- T-Bears 를 활용하여 트랜잭션을 만들어 낼 때 사용되는 커스터마이징 옵션입니다.
- URI 는 ``` 01_Local ``` 에서는 Local 으로, ``` 02_Testnet ``` 에서는 Testnet(여의도)로 설정되어있습니다. 
- stepLimit( 수수료 )을 설정합니다.

##### Show_me_the_money 디렉토리
Show_me_the_money SCORE는 ``` tbears init <project> <SCORE class> ``` 으로 만들어진 기본 SCORE를 변형하여 만들어진 SCORE입니다. ```Show_me_the_money``` SCORE는 Show_me_the_money SCORE의 주소로 ICX를 송금받게 되면, SCORE의 배포자(owner)에게 Show_me_the_money SCORE가 송금 받은 ICX를 바로 송금합니다.



## Links

#### 1. ICON official Github
https://github.com/icon-project

#### ICON T-Bears Guide
https://github.com/icon-project/t-bears
#### ICON icon-rpc-server Guide
https://github.com/icon-project/icon-rpc-server
#### ICON SCORE Guide
https://icon-project.github.io/score-guide


#### 2. ICON Developer portal
https://icondev.io/index.do

#### 3. Tracker
Mainnet : https://tracker.icon.foundation

Testnet : https://bicon.tracker.solidwallet.io

#### 4. ICONex (ICON wallet chrome web store)
https://chrome.google.com/webstore/detail/iconex/flpiciilemghbmfalicajoolhkkenfel?hl=ko

#### 5. Faucet (Testnet)
http://52.88.70.222

#### 6. GoodsEvent reference implementation
https://github.com/nomadconnection/GoodsEvent

#### 7. GoodsEvent workshop material Github
https://github.com/nanaones/GoodsEvent
