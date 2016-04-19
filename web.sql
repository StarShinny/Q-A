-- MySQL dump 10.13  Distrib 5.6.10, for Win32 (x86)
--
-- Host: localhost    Database: web_database
-- ------------------------------------------------------
-- Server version	5.6.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `content` text NOT NULL,
  `likes` int(11) DEFAULT '0',
  `adopted` varchar(30) DEFAULT 'false',
  PRIMARY KEY (`aid`),
  KEY `qid` (`qid`),
  KEY `uid` (`uid`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `questions` (`qid`) ON DELETE CASCADE,
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,2,'建议一开始不要使用Dreamweaver，否则你可能会陷入国内很多《XXX必学必会》、《X天精通XXX》和一些操着不太标准普通话大叔讲解的视频的陷阱（貌似在此黑了好多人。。。）回归正题，建议先买一本html新手入门的教材，学习html每个标签的含义和用法，推荐推荐《HTML之路：XHTML和CSS最佳实践指南》，这本书是国外著名网站HTML DOG中的精华内容的集结，完全可以零基础，零起点开始系统的学习HTML和CSS。最重要的是，它非常非常薄，看起来在心理上也不吃力。\n一些教学网站也很有帮助，例如\n可以当做参考手册的w3school 在线教程\n如果英语不是很吃力，可以看看Learn to code里面的html foundatation教程，交互式界面，正确完成任务之后还有徽章奖励，做起来很有动力\n在完成了以上步骤之后，在上网浏览网页的时候多去思考它的语义结构、布局怎样的，配色如何，那些炫目的动态效果是怎么做出来的，用到了哪些新的库，新的框架，用浏览器的“查看源代码”来验证自己的想法也是很有意思的一件事\n实践是最好的老师，接一个小任务，一点一点的完成，过程中要学会用好http://www.google.com这个好东西\n克服自己的惰性，培养自己对html的兴趣 and Good Luck！',6,'false'),(2,3,1,'首先，从节目形态上看，《爸爸去哪儿》属于电视真人秀类型。再划分得细一点，应该属于旅游生活类真人秀。 中国的电视节目经历了“晚会体”（以春晚为代表）、“游艺体”（以快乐大本营为代表），现在基本上算是走入了“竞赛体”的真人秀时代。大家可以回想一下，其实最近几年真正火过的电视节目基本上都是真人秀类型。无论中国美国皆如是。 至于为什么会出现这个现象，我觉得是因为真人秀是非常符合电视特征的。 跟电影相比，电视观看相对更随意休闲。我们不需要专门跑去电影院，坐在黑暗中等待故事开始这样一个“仪式”。电视摆在客厅里，我们随时随地都可以接收。电视成为了生活的“延伸”。 从这个角度，也许比较可以理解为什么蔡康永回应李敖的批评时说“在电视里找深度是一件很可笑的事情”。 同时，电视节目本身就有很强的综合性。在电影都有“类型融合”趋势的今天，电视节目当然也会不断地在更高层次上进行“综合”。 真人秀非常符合电视的这两个特点。 一方面，它比晚会和游艺看起来更加像生活。真人秀是一种对生活的精妙模仿。它看起来那么像我们的生活，但是其中又蕴含着陌生于生活的戏剧性。 另一方面，它具有很强的综合性。比如《中国好声音》里，就有歌唱才艺表演、竞赛冲关、普通人人生故事呈现、明星访谈等等所有这些曾经单独可以成为一个节目类型的元素。 比起《非常勿扰》、《中国好声音》、《快乐男声》、《谁是歌手》，《爸爸去哪儿》无疑在对生活的模仿上面更加细致精到。如果对前几个节目是否能成为真人秀还有疑惑的话，《爸爸去哪儿》则一定不会让人产生这个疑问。',90,'false'),(3,11,1,'hehe',31,'true'),(4,11,1,'HH',7,'false'),(5,11,1,'<img style=\"height: 200px;\" src=\"/Chrysanthemum.jpg\" alt=\"Picture Not Found.\">',4,'false'),(6,18,1,'我认为...',0,'false'),(7,19,4,'嗯！我也这么觉得！<p></p><img style=\"height: 200px;\" src=\"/Koala.jpg\" alt=\"Picture Not Found.\">',0,'false'),(8,21,4,'好了<p></p><img style=\"height: 200px;\" src=\"/Koala.jpg\" alt=\"Picture Not Found.\">',1,'true'),(9,22,4,'为什么？',0,'true'),(10,23,4,'我来回答',0,'true'),(11,28,10,'<span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\">首先先说一下，动画（2D）的概念最好不要理解成「1秒多少张」，而理解成「</span><b style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\">1张拍摄（1）成多少帧」</b><span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\">比较好。所以说成「1拍1」、「1拍2」以及「1拍3」比较好，在知乎上我已经看到无数混淆这个与fps（2）之间的概念了。因为观众看到的是最后输出的媒体格式，媒体格式的fps是固定的，跟你怎么做的并没有关系，你做30fps的3D动画，最后也有可能根据播放端需要输出成24fps.而且，一部片子就算主体风格是1拍3，也会存在1拍2甚至1拍1的动作。24帧每秒只是最早人类有限设备条件下做出的最佳视觉实践，最近这一标准似乎也动摇了。</span><div><span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\">接下来，应该说是能让人感受视觉流畅的最高拍数（拍的越多画的越少），那就是「1拍3」了，也就是1张画拍3帧。越高的拍数越考验一个原画动画师对节奏（Timing）的把握，当然并不是为了考验动画师能力才做1拍3，除非有特殊风格要求，一般这么做就是为了省钱。同时，90%以上的情况，也是拍数越少，动画效果越好（1拍1优于1拍2，以此类推）。顺带一提，在日本做出「1拍3」的鼻祖似乎是手冢治虫，遭到过后来一些动画导演的争议，而且可以说，1拍3也表现出了日本动画特有的魅力（3）。</span><br style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\"><span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\">正规的电影片很少会采用1拍3的情况。</span></div>',0,'false'),(12,29,9,'<span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\">题主太萌了，受不了啦！就是“群星”的意思！就跟著名作家“佚名”先生差不多～～</span><div><span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\"><br></span></div><p></p><img style=\"height: 200px;\" src=\"/20120619135726_eR3KT.jpg\" alt=\"Picture Not Found.\">',0,'false');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qtags`
--

DROP TABLE IF EXISTS `qtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qtags` (
  `qid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  KEY `qid` (`qid`),
  KEY `tid` (`tid`),
  CONSTRAINT `qtags_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `questions` (`qid`) ON DELETE CASCADE,
  CONSTRAINT `qtags_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `tags` (`tid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qtags`
--

LOCK TABLES `qtags` WRITE;
/*!40000 ALTER TABLE `qtags` DISABLE KEYS */;
INSERT INTO `qtags` VALUES (1,9),(1,8),(2,1),(2,4),(5,3),(5,2),(5,1),(6,2),(6,4),(7,2),(7,1),(8,2),(8,6),(9,3),(9,1),(10,3),(10,2),(11,1),(11,5),(13,7),(14,7),(16,2),(17,3),(19,2),(20,2),(22,2),(29,1),(29,4);
/*!40000 ALTER TABLE `qtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `likes` int(11) DEFAULT '0',
  `point` int(11) DEFAULT '0',
  `posedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`qid`),
  KEY `uid` (`uid`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'如何学好html','如题',1,0,'2013-11-15 07:25:17'),(2,1,'新浪微博的私信功能该如何改造','1. 选择一：坚持做IM，慢慢建立微博的强关系，私信可以作为粘住这些用户群的一个强功能——私信变成一个防守型产品，在微信/QQ网络聚合效应下，只能粘住一部分用户，谈不上进攻，甚至连防守，也只能守住强关系用户中的一部分。\n2. 选择二：基于微博单向关系，做一个有竞争力通讯产品——从微博的网络结构和ID（独立性）以及信息传播的机制看，其实从第一天开始，微博就更像一个“运营商网络”——网络中每个节点具有唯一身份，节点直接可以直接传递信息——我们为什么不可以做一个——“基于互联网的短信网络”？\n如果我们选择二，我们要解决什么问题？\n1. ID的唯一性——已解决\n2. ID之间消息开放——放开原来的互粉私信限制\n3. 消息开放带来的骚扰问题——参考短信防火墙的“未关注人私信”\n4. 基于微博金字塔关系的消息服务——私信服务平台，为媒体、名人提供私信通道能力，让大部分微博用户能“感知”私信，让媒体/名人拥有“公众发行”能力。\n5. 普通用户对于消息的感知和互动能力——私信接口开放，让企业（未来或许是用户）基于私信开发“互动性”产品，让大部分微博用户能“使用”私信，让企业除了营销之外，拥有最简单的“服务”能力。\n6. 私信服务形成竞争力之后的通道扩展——如何把企业、媒体服务，扩展到微博日覆盖用户之外，让私信成为微博的一个“向外扩展型”产品？\n其实归根结底一句话，选择了方向二，手机短信发展过程中，面临的问题（覆盖、服务、开放、商业化），这个产品未来都会遇到，短信发展过程中那些没解决好的功能（垃圾短信、开放混乱），这个产品也都会遇到。',33,0,'2013-11-15 08:32:16'),(3,1,'《爸爸去哪儿》为什么这么火','为什么呢呢呢？？？？？',50,100,'2013-11-16 07:23:27'),(4,2,'tt1\r\n','请补充您的问题\r\n\r\n',0,NULL,'2013-12-02 03:15:00'),(5,2,'aa\r\n','请补充您的问题\r\n\r\n',0,NULL,'2013-12-02 03:29:25'),(6,2,'什么\r\n','请补充您的问题\r\n\r\n',0,NULL,'2013-12-02 03:36:30'),(7,2,'叮叮\r\n','请补充您的问题\r\n\r\n',0,NULL,'2013-12-02 03:42:46'),(8,2,'啊哦\r\n','请补充您的问题\r\n\r\n',0,NULL,'2013-12-02 03:46:05'),(9,2,'啵\r\n','请补充您的问题\r\n\r\n',0,10,'2013-12-02 03:47:58'),(10,2,'好搞笑\r\n','嗯',0,0,'2013-12-02 03:51:22'),(11,2,'又来搞笑了\r\n','如题.',16,0,'2013-12-02 03:51:43'),(12,2,'又来了\r\n','如题.',0,0,'2013-12-02 03:51:59'),(13,2,'唉TT\r\n','',0,0,'2013-12-02 03:52:38'),(14,2,'KULE\r\n','',0,0,'2013-12-02 03:53:27'),(15,2,'YOU\r\n','<img style=\"height: 200px;\" src=\"/Jellyfish.jpg\" alt=\"Picture Not Found.\">',0,0,'2013-12-02 03:55:11'),(16,2,'a \r\n','哦<p></p><img style=\"height: 200px;\" src=\"/Tulips.jpg\" alt=\"Picture Not Found.\">',0,1,'2013-12-05 03:46:28'),(17,2,'a \r\n','o&nbsp;<p></p><img style=\"height: 200px;\" src=\"/Tulips.jpg\" alt=\"Picture Not Found.\">',1,0,'2013-12-05 03:48:45'),(18,2,'I have  a question\r\n','....<p></p><img style=\"height: 200px;\" src=\"/Hydrangeas.jpg\" alt=\"Picture Not Found.\">',0,0,'2013-12-05 08:32:02'),(19,2,'再问个问题\r\n','绝对是对的！',0,3,'2013-12-05 08:45:00'),(20,2,'学术问题\r\n','<br>',0,100,'2013-12-05 08:47:33'),(21,3,'为什么\r\n','额',0,0,'2013-12-05 08:54:50'),(22,3,'why?\r\n','中文名称？',0,100,'2013-12-05 09:04:48'),(23,3,'高分问题\r\n','如题.',0,200,'2013-12-05 09:11:45'),(24,3,'问个问题\r\n','嗯',0,0,'2013-12-06 01:54:27'),(25,4,'1\r\n','1',0,0,'2013-12-06 02:32:22'),(26,4,'2\r\n','2',0,0,'2013-12-06 02:32:28'),(27,4,'3\r\n','3',0,0,'2013-12-06 02:32:35'),(28,9,'人眼可以看出动画效果一秒最少需要多少张画？\r\n','<span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\">现在电影一般是24</span><br style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\"><span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\">日本动漫有8或者12的</span><br style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\"><span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\">人眼可以看出动画效果一秒最少需要多少张画？</span>',0,0,'2013-12-06 02:37:18'),(29,10,'Various Artists 是谁？\r\n','<span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\">Various Artists 是个组合么，好像翻唱了好多歌啊，都蛮好听的。.....</span><div><span style=\"color: rgb(34, 34, 34); font-size: 13px; line-height: 22px;\"><br></span></div><p></p><img style=\"height: 200px;\" src=\"/20130124003533_VQPRj.gif\" alt=\"Picture Not Found.\">',0,200,'2013-12-06 02:43:24');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'综艺'),(2,'文化'),(3,'科技'),(4,'娱乐'),(5,'体育'),(6,'军事'),(7,'生活'),(8,'IT'),(9,'教育');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `point` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'haha','7777777@yyy','1111',0),(2,'喵~','2222222','88',0),(3,'tianna','tianna@126.com','8',0),(4,'miaomiao','miaomiao@126.com','wangwang',200),(5,'sinatra','sinatra@sina.cn','1234567',0),(6,'wangwang','wangwang@126.com','miaomiao',0),(7,'velvet','qhxxl@126.com','888888',0),(8,'flower','f@126.com','888888',0),(9,'kimi^^','kimi@126.com','888888',0),(10,'angela','angela@126.com','888888',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-06 11:11:07
