-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: adidas_store_tn
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ca_num` int NOT NULL AUTO_INCREMENT,
  `ca_name` varchar(30) NOT NULL,
  PRIMARY KEY (`ca_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'신발'),(2,'의류'),(3,'용품'),(4,'청소년(8 - 16세)'),(5,'어린이(4 - 8세)'),(6,'유아(1 - 4세)');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choice` (
  `ch_num` int NOT NULL AUTO_INCREMENT,
  `ch_state` int NOT NULL DEFAULT '0',
  `ch_me_email` varchar(255) NOT NULL,
  `ch_gd_num` int NOT NULL,
  PRIMARY KEY (`ch_num`),
  KEY `ch_me_email_idx` (`ch_me_email`),
  KEY `ch_gd_num_idx` (`ch_gd_num`),
  CONSTRAINT `ch_gd_num` FOREIGN KEY (`ch_gd_num`) REFERENCES `goods` (`gd_num`),
  CONSTRAINT `ch_me_email` FOREIGN KEY (`ch_me_email`) REFERENCES `member` (`me_email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` VALUES (1,1,'k9313307@naver.com',41),(2,0,'k9313307@naver.com',42),(3,0,'k9313307@naver.com',40),(4,0,'k9313307@naver.com',29),(5,0,'k9313307@naver.com',28),(6,0,'k9313307@naver.com',7),(8,1,'k9313307@naver.com',43),(9,0,'k9313307@naver.com',27),(10,0,'k9313307@naver.com',26),(11,0,'k9313307@naver.com',22),(12,0,'k9313307@naver.com',19),(26,1,'k9313307@naver.com',11),(27,1,'k9313307@naver.com',44),(28,1,'k9313307@naver.com',12);
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailcheck`
--

DROP TABLE IF EXISTS `emailcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailcheck` (
  `em_num` int NOT NULL AUTO_INCREMENT,
  `em_email` varchar(255) NOT NULL,
  `em_checknum` varchar(10) NOT NULL,
  PRIMARY KEY (`em_num`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailcheck`
--

LOCK TABLES `emailcheck` WRITE;
/*!40000 ALTER TABLE `emailcheck` DISABLE KEYS */;
INSERT INTO `emailcheck` VALUES (4,'k9313308@gmail.com','AnnPQb'),(5,'k9313307@naver.com','fHSZkn'),(16,'k9313307@gmail.com','5Yw90U');
/*!40000 ALTER TABLE `emailcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `gd_num` int NOT NULL AUTO_INCREMENT,
  `gd_img` varchar(255) NOT NULL,
  `gd_name` varchar(100) NOT NULL,
  `gd_gender` varchar(6) NOT NULL,
  `gd_price` int NOT NULL,
  `gd_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gd_title` varchar(100) NOT NULL,
  `gd_content` longtext NOT NULL,
  `gd_code` char(6) NOT NULL,
  `gd_material` varchar(100) NOT NULL,
  `gd_color` varchar(100) NOT NULL,
  `gd_country` varchar(30) NOT NULL,
  `gd_made_date` char(6) NOT NULL,
  `gd_made_company` varchar(100) NOT NULL,
  `gd_importer` varchar(30) DEFAULT '아디다스코리아[유]',
  `gd_ca_num` int NOT NULL,
  `gd_sub_num` int NOT NULL,
  `gd_del` varchar(5) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gd_num`),
  KEY `gd_ca_num_idx` (`gd_ca_num`),
  KEY `gd_sub_num_idx` (`gd_sub_num`),
  CONSTRAINT `gd_ca_num` FOREIGN KEY (`gd_ca_num`) REFERENCES `category` (`ca_num`),
  CONSTRAINT `gd_sub_num` FOREIGN KEY (`gd_sub_num`) REFERENCES `subcategory` (`sub_num`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (7,'/2022/03/07/164b2f3d-9cb8-47a6-9c47-8b48e685f913_GW2499.png','엣지게임데이','Unisex',89000,'2022-02-22 12:01:05','스피드를 이끄는 크로스 트레이닝화','모든 방향으로 향하는 자유로운 움직임. 어떤 동작 시에도 유연하게 적응하는 아디다스 러닝화를 만나보세요. 안정감을 강화하는 토션 시스템이 지지력과 자신감을 더해줍니다. 바운스 미드솔에 매 스텝에 탄력적인 쿠셔닝을 전달합니다. 꼭 맞는 퍼포먼스 핏으로 더욱 빠르고 가벼운 질주를 경험할 수 있습니다.','GW2499','겉감: 100% 폴리에스터, 안감: 100% 폴리에스터','Core Black / Core Black / Night Metallic','중국','202201','adidasAG','아디다스코리아[유]',1,2,'N'),(8,'/2022/03/07/c7a9ee6d-5c1f-46c8-99ad-2093a7052240_HB9489.webp','아디컬러 3S 윈드브레이커 풀집 재킷','Man',129000,'2022-02-22 12:03:00','친환경 재생 원단으로 제작된 넉넉한 윈드브레이커','거친 바람 속에서 기분 좋은 에너지와 강화된 커버력을 더해주는 아디다스 재킷을 만나보세요. 매끈한 폴리에스테르 립스톱 소재가 가볍게 몸을 감싸며 자유로운 활동성을 선사합니다. 날씨에 따라 후드를 쓰거나, 밑단과 목을 조여 커버력을 조절하고 편안한 여정을 즐길 수 있습니다.','HB9489','겉감: 100%폴리에스터','Black','베트남','202201','adidasAG','아디다스코리아[유]',2,5,'N'),(9,'/2022/03/07/542447e2-bce8-4f3b-9208-d98cad4e506c_GW3955.webp','퍼렐 윌리엄스 HU NMD','Man',299000,'2022-02-23 12:50:05','퍼렐 윌리엄스 콜라보레이션 디자인의 편안한 스니커즈','시대를 앞서가는 독창성과 누구와도 다른 개성. 한계를 거부하는 다재다능한 아티스트와 오리지널스의 최신 콜라보레이션 컬렉션을 만나보세요. 기존의 틀에서 벗어나 더욱 새롭고 자유로운 표현을 이끄는 아디다스 x 퍼렐 윌리엄스 HU NMD 슈즈입니다. 유연한 아디다스 프라임니트 갑피와 아늑한 부스트 미드솔의 시너지로 매 스텝에 완벽한 편안함을 더해줍니다.','GW3955','겉감: 75%폴리에스터/25%폴리우레탄안감: 86%폴리에스터/14%폴리우레탄','Customized / Halo Blue / Wonder White','베트남','202111','adidasAG','아디다스코리아[유]',1,1,'N'),(10,'/2022/03/07/fa579b0e-95c6-4155-807a-3c7d38634edd_GW9997.webp','프레데터 엣지.1 TF','Unisex',179000,'2022-01-22 12:54:03','게임의 지배자를 위한 인조 잔디 축구화','무한한 가능성을 가진 경기장 안의 세계. 불가능을 깨는 새로운 차원의 플레이를 위해 탄생한 아디다스 프레데터 시리즈를 만나보세요. 인조 잔디 축구화의 존 스킨 갑피에 다양한 종류의 볼 접촉을 위해 제작된 특별한 고무 컨트롤 존이 적용되어 있습니다. 완벽하게 발을 감싸는 아디다스 프라임니트 칼라가 단단한 고정력을 선사합니다. 유연한 바운스 미드솔이 편안한 쿠셔닝을 제공합니다.','GW9997','겉감: 100%폴리에스터/안감: 70%폴리에스터/30%폴리우레탄특수배합합성고무','Hi-Res Blue / Turbo / Hi-Res Blue','인도네시아','202112','adidasAG','아디다스코리아[유]',1,3,'N'),(11,'/2022/03/07/99b1e6af-5537-4cd4-a835-82d12dd115d2_FY6869.webp','X 스피드플로우.1 FG','Unisex',299000,'2022-02-23 12:55:18','스피드의 정점을 제시하는 가벼운 축구화','머리부터 발끝까지 하나가 되는 순간. 예리한 감각과 민첩한 움직임의 만남으로 탄생한 놀라운 속도감을 경험해보세요. 나만의 플로우 속에서 누구보다 빠르고 앞서가는 플레이를 이끄는 아디다스 X 축구화입니다. 추진력을 강화하는 경사진 앞발과 카비텍스 탄소 섬유 인서트가 폭발적인 가속을 더해줍니다. 어질리티 케이지가 급격한 회전과 방향 전환 시에도 흔들림 없는 안정감을 선사합니다. 완벽하게 발을 감싸는 아디다스 프라임니트 갑피가 편안한 착용감을 제공합니다.','FY6869','겉감: 합성가죽/92%나일론/8%폴리우레탄안감:93%폴리에스터/7%폴리우레탄','Cloud White / Iron Metallic / Solar Red','중국','202108','adidasAG','아디다스코리아[유]',1,3,'N'),(12,'/2022/03/07/f820f134-2cc7-498b-b05f-993763ed8a76_GV7244.webp','투어360 22','Man',240000,'2022-02-23 12:56:59','친환경 재생 소재가 함유된 에너지 리턴 골프화','새로운 차원의 퍼포먼스를 이끄는 아디다스 골프화를 만나보세요. 매 스텝을 에너지로 충전시키는 부스트 미드솔이 더욱 편안하게 발을 받쳐줍니다. 완벽하게 발을 감싸는 360랩 구조로 18홀이 끝난 후에도 흔들림 없는 지지력을 선사합니다. 쿠셔닝이 뛰어난 인사이트(INSITE®) 삭라이너가 최상의 핏과 균형감을 더해줍니다. 스파이크모어 아웃솔이 마지막 라운드까지 단단한 접지력을 제공합니다.','GV7244','인조 가죽','Cloud White / Core Black / Blue Rush','중국','202112','adidasAG','아디다스코리아[유]',1,4,'N'),(13,'/2022/03/07/ff41e181-0acc-43ae-8cde-545d90ac9366_H14121.webp','아디컬러 패디드 아웃도어 재킷','Man',189000,'2022-02-23 12:58:35','쌀쌀한 날에 이상적인 스포티한 양면 재킷','차가운 공기 속의 조용한 거리와 아늑한 카페. 따뜻한 아웃도어 재킷과 함께 쌀쌀한 시즌에도 매력적인 도시의 새로운 모습을 발견해보세요. 견고한 우븐 나일론 소재가 냉기와 바람을 막아주고, 가벼운 패딩이 우수한 보온성을 선사합니다. 두 가지 색으로 구성된 양면 디자인으로 매일 다양한 룩을 연출할 수 있습니다.\r\n\r\n플라스틱 폐기물이 사라진 더 나은 미래를 목표로 재활용 원단이 사용된 친환경 제품입니다.','H14121','겉감: 100%나일론','Orbit Green / Black','방글라데시','202107','adidasAG','아디다스코리아[유]',2,5,'N'),(14,'/2022/03/07/0448a1ed-982f-4da7-aa31-7ac034b81195_GM4621.webp','MUFC A JSY','Man',119000,'2022-02-23 13:01:44','MUFC A JSY','축구 저지','GM4621','겉감: 100%폴리에스터','Cloud White','캄보디아','202112','adidasAG','아디다스코리아[유]',2,6,'N'),(15,'/2022/03/07/dadb5510-bba5-49db-8479-24480de77f4c_HC1951.webp','아디컬러 클래식 패브릭 클래시 트레포일 후디','Man',109000,'2022-02-23 13:05:39','다양한 소재와 조절식 디테일을 하나로 담아낸 아디다스 후디','디테일을 살린 정교함. 스포티한 데일리 웨어 디자인에 커다란 트레포일 그래픽과 골조직 디테일을 담아낸 아디컬러 후디입니다. 아늑하고 부드러운 프렌치 테리 소재가 완벽한 편안함을 제공합니다. 기존의 스타일과 다르게 업데이트된 뒷면의 평직 소재와 밑단 조절끈이 대담하면서도 절제된 반전을 더해줍니다.','HC1951','겉감: 100%면','Black','베트남','202112','adidasAG','아디다스코리아[유]',2,7,'N'),(16,'/2022/03/07/50661204-4229-481e-bbde-119a37985764_ED6116.webp','뉴 아이콘 티','Man',39000,'2022-02-23 13:09:17','A TEE THAT OFFERS A FRESH TWIST ON ICONIC DETAILS.','레트로 스포츠 문화에 대한 재조명. 1970년대 아디다스 헤리티지 디자인에서 영감을 받은 테크니컬 룩을 담아낸 티셔츠입니다. 한쪽 소매의 3-스트라이프를 관통하는 트레포일 로고, 넉넉한 실루엣이 모던하고 신선한 업데이트를 더해줍니다. 매끈한 면 저지 소재가 부드러운 착용감을 제공합니다.','ED6116','겉감: 100% 면','Black','캄보디아','202201','adidasAG','아디다스코리아[유]',2,8,'N'),(17,'/2022/03/07/654ea3f1-f438-40e5-bbbd-b1145ae41c1a_H13797.webp','유틸리타스 풀집 미드레이어 재킷 (젠더 뉴트럴)','Unisex',139000,'2022-02-23 13:10:52','추위를 막아주는 따뜻하고 넉넉한 발수 재킷','어떤 날씨에도 멈추지 않는 자유로운 여정을 위해 준비된 아디다스 재킷을 만나보세요. 아늑한 플리스와 신축성 있는 나일론 소재의 조화로 흐리고 쌀쌀한 날에도 편안하게 착용할 수 있습니다. 비로 인한 수분 침투를 차단하는 발수 오버레이가 쾌적한 커버력을 더해줍니다.\r\n\r\n플라스틱 폐기물이 사라진 더 나은 미래를 목표로 재활용 원단이 사용된 친환경 제품입니다.','H13797','겉감: 100%폴리에스터','Black','중국','202105','adidasAG','아디다스코리아[유]',2,9,'N'),(18,'/2022/03/07/9e25be9b-fd2a-465c-a6f9-889eec2d479c_HI1976.webp','올오버 프린트 스웨트 팬츠 (젠더 뉴트럴)','Unisex',129000,'2022-02-23 13:12:19','새로운 차원의 편안함과 스타일을 담아낸 대담한 프린트 스웨트 팬츠','모든 움직임을 편안하게 지켜주는 아디다스 x IVY PARK 스웨트 팬츠를 만나보세요. 무게감 있는 프렌치 테리 소재가 아늑하고 기분 좋은 착용감을 제공합니다. 하트 그래픽이 담긴 대담한 뱀피 프린트가 차원이 다른 스타일을 완성합니다.\r\n\r\n지속 가능한 면 생산을 목표로 하는 비영리 단체, \'베터 코튼 이니셔티브\'와 파트너십을 통해 탄생한 제품입니다.','HI1976','겉감: 100%면','Cherry Wood','태국','202112','adidasAG','아디다스코리아[유]',2,10,'N'),(19,'/2022/03/07/e5794681-d6bd-480e-a7cf-0cbfd8244a88_HB6378.webp','에어로레디 라이트 라이드 쇼츠','Man',69000,'2022-02-23 13:13:43','고강도 트레이닝에 이상적인 매끈한 고기능성 쇼츠','고강도 다리 운동과 격렬한 스피닝 클래스를 편안하게 지켜주는 아디다스 쇼츠를 만나보세요. 습기를 흡수하는 에어로레디 기술로 땀이 폭발하는 순간에도 쾌적한 착용감을 제공합니다. 몸과 하나처럼 움직이는 허리밴드가 부드러운 신축성을 선사합니다.\r\n\r\n아디다스의 고기능성 재활용 원단인 프라임그린으로 제작된 친환경 제품입니다.','HB6378','겉감: 87%폴리에스터/13%폴리우레탄','Black','태국','202104','adidasAG','아디다스코리아[유]',2,11,'N'),(20,'/2022/03/07/0d8715e9-01ff-4517-b464-289c5c6be3a7_GM3804.webp','테크 우먼스 니트 풀집업','Women',198000,'2022-02-23 13:15:12','서늘한 날의 플레이에 이상적인 니트 골프 재킷','예측할 수 없는 날씨의 변덕스러운 기온에 편안하게 적응할 수 있는 아디다스 골프 재킷을 만나보세요. 텍스처를 더해주는 세련된 니트 소재가 쌀쌀한 추위 속에서 아늑하고 부드러운 착용감을 선사합니다.','GM3804','나일론 니트 100%','Collegiate Navy','중국','202010','adidasAG','아디다스코리아[유]',2,5,'N'),(21,'/2022/03/07/cdec6d1d-1ae7-4a12-ab2e-e7e63df5116b_GV1243.webp','우먼스 보아 세트','Women',238000,'2022-02-23 13:16:39','우먼스 보아 세트','후드','GV1243','70% 폴리에스테르/30% 재생 폴리에스테르','Black','캄보디아','202108','adidasAG','아디다스코리아[유]',2,7,'N'),(22,'/2022/03/07/6662c4d9-2e00-4240-aa03-cb6d12062218_HI6015.webp','V-데이 티 (젠더 뉴트럴)','Unisex',55000,'2022-02-23 13:18:13','자신에 대한 사랑의 메시지를 녹여낸 밸런타인데이 티셔츠','사랑의 기운으로 가득찬 밸런타인데이를 새롭게 맞이하는 아디다스 시리즈를 만나보세요. 자신을 사랑하도록 일깨우는 시 그래픽 자수를 담아낸 반팔 티셔츠입니다. 나를 더 아끼면서 주변 사람들에게도 긍정적인 에너지를 전파할 수 있도록 스스로를 향한 사랑과 존중의 여정을 기념하는 특별한 디자인을 선보입니다.\r\n\r\n지속 가능한 면 생산을 목표로 하는 비영리 단체, \'베터 코튼 이니셔티브\'와 파트너십을 통해 탄생한 제품입니다.','HI6015','겉감: 100%면','Black','인도네시아','202111','adidasAG','아디다스코리아[유]',2,8,'N'),(23,'/2022/03/07/322e2433-2cb3-4a29-b046-0d66616a1084_HC9168.webp','D2M 타이츠','Women',59000,'2022-02-23 13:19:35','친환경 재생 소재가 함유된 쾌적하고 끈적임 없는 타이츠','그 어떤 것도 막을 수 없는 의지. 목표를 향해 끊임없이 도전하는 애슬리트를 위한 아디다스 타이츠를 만나보세요. 신축성이 뛰어난 매끈하고 유연한 구조로 더욱 자유롭게 움직일 수 있습니다. 땀과 열기를 조절하는 에어로레디의 끈적임 없는 쾌적함 속에서 최상의 컨디션을 즐길 수 있습니다.','HC9168','겉감: 89%폴리에스터/11%폴리우레탄','Black / Black','캄보디아','202111','adidasAG','아디다스코리아[유]',2,12,'N'),(24,'/2022/03/07/9125dcda-a0f8-4c9a-8f22-d46c738ad74e_HB3573.webp','스테이트먼트 프라임니트 플리츠 스커트','Women',198000,'2022-02-23 13:20:47','친환경 재생 소재로 제작된 골프 주름 스커트','편안함과 스타일의 완벽한 조화를 담아낸 골프 스커트를 만나보세요. 유연한 아디다스 프라임니트의 역동적인 핏으로 마지막 홀까지 자유롭게 움직일 수 있습니다. 스커트와 분리된 언더쇼츠가 강화된 커버력과 자신감을 더해줍니다. 밑단을 향해 퍼지는 플레어드 실루엣과 섬세한 주름 디테일이 모던한 룩을 선사합니다.\r\n\r\n플라스틱 폐기물을 없애기 위한 친환경 솔루션의 일환으로 100% 재활용 원단이 사용된 제품입니다.','HB3573','100% 재생 폴리에스테르','Black','중국','202201','adidasAG','아디다스코리아[유]',2,13,'N'),(25,'/2022/03/07/39f6eb6c-9891-4d61-b059-df92ddc72ce9_HC4552.webp','아디컬러 클래식 우븐 백 오버사이즈드 스웨터 드레스','Women',89000,'2022-02-23 13:21:50','넉넉한 디자인의 스웨터 드레스','편안함과 스타일을 하나로 담아낸 아디다스 스웨터 드레스를 만나보세요. 패션과 실용성의 완벽한 조화로 매일 다양하게 활용할 수 있습니다. 부드럽게 피부를 감싸는 면 소재가 편안하고 기분 좋은 착용감을 제공합니다. 느슨하게 몸을 감싸는 루즈 핏으로 더욱 자유롭게 움직일 수 있습니다.','HC4552','겉감: 100%폴리에스터','Shadow Navy','캄보디아','202112','adidasAG','아디다스코리아[유]',2,14,'N'),(26,'/2022/03/07/935b204d-0822-49cb-9651-db2e3c62bb67_DZ9388.webp','쿠션 로우삭스 1PP','Unisex',6000,'2022-02-23 13:24:01','쿠션 로우삭스 1PP','양말','DZ9388','겉감: 58% 면/40% 폴리에스터/2% 폴리우레탄','White / White / Black','터키','202112','adidasAG','아디다스코리아[유]',3,15,'N'),(27,'/2022/03/07/599509fc-0c5f-4c77-96d5-d2d4e5ecc29f_GM6278.webp','에어로레디 BB 캡 3S 4A','Unisex',29000,'2022-02-23 13:25:38','에어로레디 BB 캡 3S 4A','무더운 밤과 차가운 아이스크림. 뜨거운 여름의 편안한 트레이닝을 위해 준비된 클래식 베이스볼 캡을 만나보세요. 습기를 배출하는 에어로레디 소재가 산뜻하고 쾌적한 착용감을 선사합니다. 넓은 커브 챙이 강렬한 햇빛을 차단하고, 아디다스 3-스트라이프가 스포티한 룩을 더해줍니다.','GM6278','겉감: 90% 폴리에스터/10% 폴리우레탄','Black / White / White','중국','202111','adidasAG','아디다스코리아[유]',3,16,'N'),(28,'/2022/03/07/bec15e65-6720-41fa-b401-a8adb7c6178b_HE2693.jpg','메쉬 클래식 백팩','Unisex',65000,'2022-02-23 13:27:18','노트북 포켓이 포함된 편리한 친환경 백팩','새로운 소재로 업그레이드된 아디다스 클래식 백팩을 만나보세요. 앞면을 둘러싼 메쉬 지퍼 포켓이 산뜻하고 세련된 분위기를 연출합니다. 스포츠의 에너지가 담긴 커다란 퍼포먼스 로고가 아이코닉한 룩을 선사합니다.\r\n\r\n버진 플라스틱 생산으로 인한 환경 오염을 줄이기 위해 남은 재료 조각과 같은 생산 폐기물, 소비자 사용 후 수거된 생활 폐기물을 가공하여 만든 재활용 소재가 함유되어 있습니다.','HE2693','겉감: 100%폴리에스터','Black','중국','202110','adidasAG','아디다스코리아[유]',3,17,'N'),(29,'/2022/03/07/8468c368-b83a-40db-aafb-7fde437a3902_GL8870.webp','하이브리드 글로브','Man',29000,'2022-02-23 13:28:37','단단한 그립감을 선사하는 골프 장갑','착용하는 순간 손을 감싸는 자신감. 부드러운 가죽 손바닥의 편안하고 흔들림 없는 그립감을 담아낸 골프 장갑입니다. 손등의 견고한 인조 가죽 소재가 강화된 유연성을 선사합니다. 손가락의 통풍 천공이 원활한 공기 순환을 유지하고 마지막 라운드까지 쾌적함을 더해줍니다.','GL8870','가죽 100%','White / Silver Metallic','인도네시아','202105','adidasAG','아디다스코리아[유]',3,18,'N'),(35,'/2022/03/07/dd5b2b2d-ae2b-43cb-92e8-368618cd0b4a_GW8123.webp','아디다스 X 레고 스포츠 프로','Kids',99000,'2022-03-07 15:38:16','아디다스 X 레고® 브랜드 컬렉션의 친환경 스니커즈','한계가 없는 상상력과 창의성. 레고® 블록과 함께하는 경쾌하고 활기찬 질주를 위해 준비된 주니어용 러닝화입니다. 니트 갑피의 다양한 교차 패턴, 클래식 레고® 컬러의 조화로 두 브랜드가 하나로 담긴 대담한 룩을 선사합니다. 블록 모양의 재밌는 발자국을 남기는 고무 아웃솔이 안정적인 접지력을 제공합니다.','GW8123','겉감: 100%폴리에스터/합성가죽/안감: 100%폴리에스터특수배합합성고무','Core Black / Core Black / Eqt Yellow','베트남','202201','adidasAG','아디다스코리아[유]',4,19,'N'),(36,'/2022/03/07/750137b5-6fe7-4524-8702-25162e3493fa_H65318.webp','아디다스 X 레고 비디요 트랙 수트','Kids',99000,'2022-03-07 15:39:54','친환경 재생 소재로 제작된 주니어용 레고® 트랙 수트','레고® 비디요™와 함께 재탄생한 아디다스의 아이코닉한 스타일을 만나보세요. 레고® 비트비츠의 경쾌하고 다채로운 색상을 녹여낸 대담한 주니어용 트랙 수트입니다. 데일리 운동부터 뮤직 비디오 촬영까지 언제 어디서나 편안하게 착용하고 자유로운 하루를 즐길 수 있습니다.','H65318','겉감: 100%폴리에스터','White / Blue / Bright Blue / Semi Solar Gold','필리핀','202111','adidasAG','아디다스코리아[유]',4,20,'N'),(37,'/2022/03/07/5234d4a5-5ec8-497c-aaa0-3d336d02f521_HB1228.webp','클래식 레고 캡','Kids',20000,'2022-03-07 15:41:02','친환경 재생 소재가 함유된 레고® 캡','레고® 블록의 팬을 위한 주니어용 트레이닝 캡을 만나보세요. 대담한 색상의 컬러풀한 에너지 속에서 더욱 활기찬 하루를 즐길 수 있습니다. 패드처리된 스웨트밴드가 눈에 땀이 흘러내리지 않도록 즉시 흡수합니다. 뒷면의 스냅을 사용하여 꼭 맞게 핏을 조절할 수 있습니다.','HB1228','겉감: 100%폴리에스터','Red / Bright Blue / White','중국','202111','adidasAG','아디다스코리아[유]',4,21,'N'),(38,'/2022/03/07/f38da2b1-1466-4d20-b7e7-740bae1f903d_FY7981.webp','포럼 로우','Kids',79000,'2022-03-07 15:42:17','농구화에서 영감을 얻은 데일리 슈즈','아이들을 위해 새롭게 돌아온 전설적인 농구화를 만나보세요. 아이코닉한 아디다스 포럼을 미니 사이즈로 재구성한 아동용 슈즈입니다. 청키한 실루엣과 시그니처 엑스자 스트랩이 80년대 코트를 열광시킨 대담한 룩을 선사합니다. 헤드밴드, 쇼트 팬츠와 함께 스포티한 레트로 스타일을 연출할 수 있습니다.','FY7981','겉감: 합성가죽/60%폴리우레탄/40%폴리에스터/안감: 100%폴리에스터특수배합합성고무','Cloud White / Cloud White / Cloud White','인도네시아','202112','adidasAG','아디다스코리아[유]',5,22,'N'),(39,'/2022/03/07/2a113a9a-6489-4032-8b7b-c7007dc7e41f_HB9465.webp','디즈니 미키 앤 프렌즈 후디 / 팬츠 세트','Kids',99000,'2022-03-07 15:43:51','디즈니 콜라보레이션 디자인의 아늑하고 경쾌한 상하의 세트','아이들의 기분 좋은 하루를 위해 준비된 아디다스 투 피스 세트를 만나보세요. 부드러운 프렌치 테리 소재로 제작된 아늑한 후디와 팬츠로 구성되어 있습니다. 디즈니 미키마우스에게 영감을 얻은 다양한 그래픽과 함께 더욱 느긋하고 여유로운 하루를 즐길 수 있습니다.','HB9465','겉감: 70%면/30%폴리에스터','Vivid Red','중국','202111','adidasAG','아디다스코리아[유]',5,23,'N'),(40,'/2022/03/07/4abc5beb-e15e-4c6f-b747-2e56a3fea033_HC9599.jpg','디즈니 미키 & 프렌즈 2-웨이 백팩','Kids',49000,'2022-03-07 15:45:09','친환경 재생 소재가 함유된 아디다스 X 디즈니 백팩','미키마우스의 친구들과 함께하는 신나는 여름을 위해 준비된 아동용 백팩을 만나보세요. 가방을 장식하는 디즈니 그래픽이 경쾌하고 신선한 룩을 선사합니다. 밝고 선명한 색상이 아디다스만의 스포티한 에너지를 더해줍니다. 어깨 스트랩 또는 상단 핸들을 사용하여 편안하게 휴대할 수 있습니다. 작은 물건을 깔끔하게 정리하고 따로 보관할 수 있는 별도의 지갑이 포함되어 있습니다. 필요에 따라 백팩과 추가 수납공간을 다양하게 활용할 수 있습니다','HC9599','겉감: 100%폴리에스터','Black','베트남','202111','adidasAG','아디다스코리아[유]',5,24,'N'),(41,'/2022/03/07/87a2fde5-81a1-4a1c-9980-22289d31683b_GX3269.jpg','슈퍼스타 360','Kids',59000,'2022-03-07 15:46:25','친환경 재생 소재가 함유된 아디다스 슈퍼스타 슬립온 슈즈','공룡을 사랑하는 어린 모험가를 위한 유아용 아디다스 슈퍼스타 슈즈를 만나보세요. 대담한 디테일이 돋보이는 유연한 메쉬 갑피가 경쾌한 에너지와 쾌적한 편안함을 더해줍니다. 공룡에 대해 잘 알려지지 않은 정보가 삭라이너에 담겨 있으며, 오른발과 왼발을 구분할 수 있는 그래픽이 적용되어 있습니다.','GX3269','겉감: 93% 폴리에스터/7% 폴리우레탄/ 고무/안감: 86%폴리에스터/14%폴리우레탄100%EVA','Team Solar Green / Team Green / Cloud White','인도네시아','202111','adidasAG','아디다스코리아[유]',6,25,'N'),(42,'/2022/03/07/0df6f64c-0d54-4035-8c73-459a94f6bd1d_H20314.webp','카모 프린트 다운 재킷','Kids',109000,'2022-03-07 15:47:35','편리한 탈부착 후드가 포함된 따뜻한 재킷','추위에도 흔들림 없는 스타일. 기온이 떨어지기 시작하는 쌀쌀한 계절을 위해 준비된 유아용 다운 재킷입니다. 날씨에 따라 후드를 부착하거나 분리할 수 있습니다. 전면 카모플라주 프린트가 신선한 룩을 선사합니다.','H20314','겉감: 100%폴리에스터','Night Sky / Multicolor','베트남','202111','adidasAG','아디다스코리아[유]',6,26,'N'),(43,'/2022/03/22/3c786768-c407-4985-b73e-9918bf4671bf_DZ9388.webp','결제용','Unisex',1000,'2022-03-21 15:27:12','ㅇㅇ','ㅇㅇ','AAAAAA','aa','aa','aa','111111','aa','아디다스코리아[유]',3,15,'N'),(44,'/2022/03/22/2e5f24e1-0c88-466f-93f8-e104118d79dd_ED6116.webp','결제용2','Unisex',1000,'2022-03-22 09:40:33','ㄴㄴ','ㄴㄴ','SSSSSS','ss','ss','ss','222222','ss','아디다스코리아[유]',2,8,'N');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `li_num` int NOT NULL AUTO_INCREMENT,
  `li_state` int NOT NULL DEFAULT '0',
  `li_me_email` varchar(255) NOT NULL,
  `li_re_num` int NOT NULL,
  PRIMARY KEY (`li_num`),
  KEY `li_re_num_idx` (`li_re_num`),
  KEY `li_me_email_idx` (`li_me_email`),
  CONSTRAINT `li_me_email` FOREIGN KEY (`li_me_email`) REFERENCES `member` (`me_email`),
  CONSTRAINT `li_re_num` FOREIGN KEY (`li_re_num`) REFERENCES `review` (`re_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (5,-1,'k9313307@naver.com',9);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `me_email` varchar(255) NOT NULL,
  `me_pw` varchar(255) NOT NULL,
  `me_name` varchar(30) NOT NULL,
  `me_address` varchar(255) NOT NULL,
  `me_phone` char(13) NOT NULL,
  `me_authority` varchar(10) DEFAULT '회원',
  `me_postnum` varchar(10) NOT NULL,
  `me_address_detail` varchar(255) DEFAULT NULL,
  `me_session_id` varchar(255) DEFAULT NULL,
  `me_session_limit` datetime DEFAULT NULL,
  PRIMARY KEY (`me_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('k9313307@gmail.com','$2a$10$4JxibWF0NaxWq.02HWtKQOd.oImLCIMAzTLtoZ4h/50EGk21wym3S','회원','서울 송파구 가락로33길 2','010-3333-3333','회원','05643','33',NULL,NULL),('k9313307@naver.com','$2a$10$F02QLa.1oEpUgSgDkXIa0uaagzuhVHCk3J1MKTG16PQrzqO.1P/du','k9313307','서울 강남구 논현로111길 3','010-1111-1111','관리자','06122','1111','CD2E7FC70918D02A4449E0E172F87248','2022-04-12 11:53:19'),('k9313308@gmail.com','$2a$10$jo8nTnilFVnaejLY/yyoA.k.8QuUu2jkN8TDtZZnxhtqOBrO0HJdS','k9313308','부산 서구 구덕로222번길 5','010-2222-2233','회원','49223','222','none','2022-04-01 12:05:15');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylist`
--

DROP TABLE IF EXISTS `mylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylist` (
  `my_num` int NOT NULL AUTO_INCREMENT,
  `my_amount` int NOT NULL DEFAULT '0',
  `my_me_email` varchar(255) NOT NULL,
  `my_op_num` int NOT NULL,
  PRIMARY KEY (`my_num`),
  KEY `my_me_email_idx` (`my_me_email`),
  KEY `my_op_num_idx` (`my_op_num`),
  CONSTRAINT `my_me_email` FOREIGN KEY (`my_me_email`) REFERENCES `member` (`me_email`),
  CONSTRAINT `my_op_num` FOREIGN KEY (`my_op_num`) REFERENCES `option` (`op_num`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylist`
--

LOCK TABLES `mylist` WRITE;
/*!40000 ALTER TABLE `mylist` DISABLE KEYS */;
INSERT INTO `mylist` VALUES (82,1,'k9313307@naver.com',7),(83,2,'k9313307@naver.com',10);
/*!40000 ALTER TABLE `mylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option` (
  `op_num` int NOT NULL AUTO_INCREMENT,
  `op_gd_num` int NOT NULL,
  `op_size` varchar(5) NOT NULL,
  `op_amount` int NOT NULL,
  PRIMARY KEY (`op_num`),
  KEY `op_gd_num_idx` (`op_gd_num`),
  CONSTRAINT `op_gd_num` FOREIGN KEY (`op_gd_num`) REFERENCES `goods` (`gd_num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES (1,7,'250',43),(2,7,'260',35),(3,10,'250',50),(4,11,'250',22),(5,7,'255',15),(6,12,'280',27),(7,43,'FREE',99),(8,44,'S',50),(9,44,'XS',50),(10,44,'M',30);
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `or_num` int NOT NULL AUTO_INCREMENT,
  `or_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `or_name` varchar(30) NOT NULL,
  `or_address` varchar(255) NOT NULL,
  `or_phone` char(13) NOT NULL,
  `or_me_email` varchar(255) NOT NULL,
  `or_postnum` varchar(10) NOT NULL,
  `or_address_detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`or_num`),
  KEY `or_me_email_idx` (`or_me_email`),
  CONSTRAINT `or_me_email` FOREIGN KEY (`or_me_email`) REFERENCES `member` (`me_email`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (9,'2022-03-10 12:27:28','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(10,'2022-03-10 17:31:39','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(14,'2022-03-11 11:16:58','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(16,'2022-03-11 14:29:09','k9313308','부산 서구 구덕로222번길 5','010-2222-2233','k9313308@gmail.com','49223','222'),(17,'2022-03-11 17:34:27','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(18,'2022-03-11 17:48:23','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(19,'2022-03-11 17:48:28','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(21,'2022-03-15 09:39:49','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(32,'2022-03-16 17:32:35','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(33,'2022-03-16 17:32:35','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(34,'2022-03-17 11:16:08','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(35,'2022-03-17 11:16:08','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(36,'2022-03-17 11:16:08','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(37,'2022-03-17 11:16:08','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(38,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(39,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(40,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(41,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(42,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(43,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(44,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(45,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(46,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(47,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(48,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(49,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(50,'2022-03-21 09:35:53','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(51,'2022-03-21 09:37:19','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(52,'2022-03-21 09:37:19','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(53,'2022-03-21 12:57:25','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(55,'2022-03-21 17:36:57','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(56,'2022-03-21 17:38:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(57,'2022-03-21 17:39:55','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(61,'2022-03-22 10:51:35','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(62,'2022-03-22 10:51:35','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(80,'2022-03-22 15:18:14','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(81,'2022-03-22 15:18:14','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(88,'2022-03-22 15:48:59','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(89,'2022-03-22 16:11:33','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(90,'2022-03-22 16:25:27','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(91,'2022-03-22 16:47:35','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(97,'2022-03-28 10:47:50','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(98,'2022-03-28 10:49:52','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(99,'2022-03-28 16:59:04','k9313308','부산 서구 구덕로222번길 5','010-2222-2233','k9313308@gmail.com','49223','222');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlist` (
  `ol_num` int NOT NULL AUTO_INCREMENT,
  `ol_op_num` int NOT NULL,
  `ol_or_num` int NOT NULL,
  `ol_total_price` int NOT NULL,
  `ol_amount` int NOT NULL,
  `ol_state` varchar(10) NOT NULL DEFAULT '주문완료',
  `ol_uid` varchar(255) NOT NULL,
  PRIMARY KEY (`ol_num`),
  KEY `ol_or_num_idx` (`ol_or_num`),
  KEY `ol_op_num_idx` (`ol_op_num`),
  CONSTRAINT `ol_op_num` FOREIGN KEY (`ol_op_num`) REFERENCES `option` (`op_num`),
  CONSTRAINT `ol_or_num` FOREIGN KEY (`ol_or_num`) REFERENCES `order` (`or_num`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (4,3,9,358000,2,'배송준비중',''),(5,4,10,299000,1,'배송중',''),(9,5,14,178000,2,'주문완료',''),(11,1,16,89000,1,'배송완료',''),(12,3,17,716000,4,'배송완료',''),(13,4,18,299000,1,'배송중',''),(14,4,19,299000,1,'배송중',''),(16,6,21,240000,1,'주문완료',''),(27,1,32,89000,1,'주문완료',''),(28,2,33,178000,2,'주문완료',''),(29,5,34,89000,1,'주문완료',''),(30,2,35,89000,1,'주문완료',''),(31,4,36,299000,1,'주문완료',''),(32,1,37,267000,3,'주문완료',''),(33,3,38,179000,1,'주문완료',''),(34,4,39,299000,1,'주문완료',''),(35,6,40,240000,1,'주문완료',''),(36,1,41,89000,1,'주문완료',''),(37,2,42,89000,1,'주문완료',''),(38,5,43,89000,1,'주문완료',''),(39,3,44,179000,1,'주문완료',''),(40,4,45,299000,1,'주문완료',''),(41,6,46,240000,1,'주문완료',''),(42,1,47,89000,1,'주문완료',''),(43,2,48,89000,1,'주문완료',''),(44,5,49,89000,1,'주문완료',''),(45,4,50,299000,1,'배송완료',''),(46,3,51,179000,1,'주문완료',''),(47,4,52,299000,1,'주문완료',''),(48,3,53,179000,1,'배송준비중',''),(93,9,97,1000,1,'배송완료','imp_248045315701'),(94,8,98,1000,1,'배송완료','imp_601159038211'),(95,9,99,1000,1,'배송완료','imp_730320540974');
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `re_num` int NOT NULL AUTO_INCREMENT,
  `re_title` varchar(255) NOT NULL,
  `re_content` longtext NOT NULL,
  `re_star` int NOT NULL DEFAULT '1',
  `re_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `re_gd_num` int NOT NULL,
  `re_me_email` varchar(255) NOT NULL,
  `re_up` int DEFAULT '0',
  `re_down` int DEFAULT '0',
  PRIMARY KEY (`re_num`),
  KEY `re_gd_num_idx` (`re_gd_num`),
  KEY `re_me_email_idx` (`re_me_email`),
  CONSTRAINT `re_gd_num` FOREIGN KEY (`re_gd_num`) REFERENCES `goods` (`gd_num`),
  CONSTRAINT `re_me_email` FOREIGN KEY (`re_me_email`) REFERENCES `member` (`me_email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (9,'리뷰1','리뷰1',3,'2022-03-28 16:59:40',44,'k9313308@gmail.com',0,2),(11,'리뷰','1',1,'2022-04-04 09:40:04',11,'k9313307@naver.com',0,0),(13,'내 리뷰1','내 리뷰',4,'2022-04-05 12:36:39',44,'k9313307@naver.com',0,0);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `sub_num` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(30) NOT NULL,
  `sub_ca_num` int NOT NULL,
  PRIMARY KEY (`sub_num`),
  KEY `sub_ca_num_idx` (`sub_ca_num`),
  CONSTRAINT `sub_ca_num` FOREIGN KEY (`sub_ca_num`) REFERENCES `category` (`ca_num`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'오리지널스',1),(2,'러닝',1),(3,'축구',1),(4,'골프',1),(5,'자켓',2),(6,'축구 저지',2),(7,'후디',2),(8,'티셔츠',2),(9,'트랙수트/트랙탑',2),(10,'팬츠',2),(11,'반바지',2),(12,'타이즈',2),(13,'스커트',2),(14,'원피스',2),(15,'양말',3),(16,'모자',3),(17,'가방',3),(18,'장갑',3),(19,'신발',4),(20,'의류',4),(21,'용품',4),(22,'신발',5),(23,'의류',5),(24,'용품',5),(25,'신발',6),(26,'의류',6);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-14  9:52:18
