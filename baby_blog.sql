/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : baby_blog

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-12-25 16:07:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目',
  `title` varchar(70) NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(225) NOT NULL DEFAULT '' COMMENT '缩略图',
  `keywords` varchar(80) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` mediumtext NOT NULL COMMENT 'SEO简介',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 ，2-删除',
  `sort` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `author` varchar(50) NOT NULL DEFAULT 'Admin' COMMENT '作者',
  `summary` text NOT NULL COMMENT '摘要',
  `is_top` tinyint(2) DEFAULT '1' COMMENT '是否推荐，1-不推荐，2-推荐',
  `photos` longtext NOT NULL,
  `is_index` tinyint(1) DEFAULT '1' COMMENT '是否首页头条 1-不是，2-是',
  `praise` int(10) DEFAULT '0' COMMENT '点赞数',
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`,`sort`) USING BTREE,
  KEY `catid` (`id`,`cat_id`,`status`) USING BTREE,
  KEY `sort` (`id`,`cat_id`,`status`,`sort`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('5', '2', 'PHP是什么1', 'static/upload/article_thumb/825d410d78433cb35dcf027774721d59.png', 'PHP', 'PHP是什么', '<p>PHP（外文名:PHP: Hypertext Preprocessor，中文名：&ldquo;超文本预处理器&rdquo;）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。</p>\r\n\r\n<p>用PHP做出的动态页面与其他的编程语言相比，PHP是将程序嵌入到HTML（标准通用标记语言下的一个应用）文档中去执行，执行效率比完全生成HTML标记的CGI要高许多；PHP还可以执行编译后代码，编译可以达到加密和优化代码运行，使代码运行更快。</p>\r\n\r\n<p>全球市场分析</p>\r\n\r\n<p>目前PHP在全球网页市场、手机网页市场还有为手机提供API（程序接口）排名第一。</p>\r\n\r\n<p>在中国微信开发大量使用PHP来进行开发。</p>\r\n\r\n<p>北京、上海的用人需求</p>\r\n\r\n<p style=\"text-align:center\">上海2016年11月份中某一天用人低峰的招聘量：</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/uploads/Article/20190917/61ba94e86182d6e5f6e3120a01809554.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">北京2016年11月份中某一天用人低峰的招聘量：</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/uploads/Article/20190917/a3f34f139125a31b120a37619f49fe21.jpg\" /></p>', '1', '100', '104', '2019-12-13 18:15:31', '2019-12-19 17:43:08', '未知', 'PHP（外文名:PHP: Hypertext Preprocessor，中文名：“超文本预处理器”）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。', '1', '1', '1', '5', '1');
INSERT INTO `article` VALUES ('4', '2', '为什么学习PHP？3', '', '', '', '<p>回答本书的几个问题吧。你到底，为什么要学习PHP？</p><p>全国都缺PHP人才，非常好就业，PHP现在的工资水平很高，刚毕业可以拿到5000-9000每个月，特别优秀还可以破万。并且有非常多的就业机会。</p><p>PHP入门简单，学习入门易入手。</p><p>很多人反馈上完大学的C语言课程、java课程不会写任何东西。<br/>诚然，中国的大学都以C语言作为主要的入门语言。但是，我们认为PHP是最简单入门，也是最合适入门的语言。</p><p>你将学习到编程的思路，更加程序化的去处理问题。处理问题，将会更加规范化。</p><p>如果你要创业，如果你要与互联网人沟通。未来互联网、移动互联网、信息化将会进一步围绕在你身边。你需要与人沟通，与人打交道。</p><p>还有机会进入BAT（百度、阿里、腾讯），BAT这些企业他们在用PHP。国内和国外超一线的互联网公司，在超过90%在使用PHP来做手机API或者是网站。连微信等开放平台中的公众号的服务端也可以使用到PHP。</p><p>大并发，还能免费。一天1个亿的访问量怎么办？PHP拥有大量优秀的开发者，在一定数据量的情况下完全能满足你的需求。国内外一线的互联网公司，很多将自己的大并发方案进行开源了。你可以免费获得很多成熟的、免费的、开源的大并发解决方案。</p><p>开源更加节约成本也更加安全。windows很多都要收取授权费用，而使用linux的LAMP架构或者LNMP架构会更加安全。全球的黑客在帮你找漏洞。全球的工程师在帮忙修复漏洞。你发现一个他人已经消灭10个。</p>', '1', '100', '36', '2019-12-19 18:15:43', '0000-00-00 00:00:00', '未知', '回答本书的几个问题吧。你到底，为什么要学习PHP？\r\n全国都缺PHP人才，非常好就业，PHP现在的工资水平很高，刚毕业可以拿到5000-9000每个月，特别优秀还可以破万。并且有非常多的就业机会。', '1', '', '1', '3', '1');
INSERT INTO `article` VALUES ('6', '2', '零基础也能学习', '', '', '', '<p>学习PHP前很多人担心PHP是不是能真的学会。</p><p>学习PHP学历要求不高，数学水平要求也不高，只需要会下面这些，你就可以跟着PHP中文网，开始愉快、高薪的PHP学习之旅：</p><p>有一台电脑</p><p>初中及以上文化水平</p><p>必须会打字（五笔、拼音均可）</p><p>会word（微软的office办公软件中的文字编辑软件）</p><p>会上网（QQ，写邮件，玩微信，看小说，看电影，注册网站帐号，网上购物等）</p><p>有一颗坚持的心</p><p>如果会一点html就更好了.学习HTML可以去看我们开源的另外一本HTML入门书籍。</p><p>不会HTML怎么办？也可以学习我们免费的HTML入门视频。</p>', '1', '100', '12', '2019-12-19 18:15:43', '0000-00-00 00:00:00', '未知', '学习PHP前很多人担心PHP是不是能真的学会。\r\n\r\n学习PHP学历要求不高，数学水平要求也不高，只需要会下面这些，你就可以跟着PHP中文网，开始愉快、高薪的PHP学习之旅：\r\n有一台电脑', '1', '', '1', '1', '1');
INSERT INTO `article` VALUES ('7', '2', '为什么有些人学不会', '', '', '', '<p>互联网进入到人们生活中的方方面面了，世界首富比尔盖茨多次提到青少年编程，而编程是一种思维习惯的转化。</p><p>作为写了10几年程序的人，我听到过一些说编程不好学的抱怨。</p><p>从目前见到的数据统计，主要是因为在大学学习时遇到了C语言，学完后还不知道能干什么。很多人大学上完也就这么糊涂、恐惧的就过来了。</p><p>只有很少的不到1%的人学不会，这部份往往是专业的艺术家，在艺术家里面极少一部份人外，他们的思维模式和我们遇到的大多数人不太一样，并且不进行编程思维的训练，所以学不会。</p><p>而造成这个原因主要是因为社会、文化、背景、生活圈子多方面造成的。而不是因为笨。</p><p>那我们绝大多数的人是哪些原因学不会的呢？</p><p>1. 不相信自己能学会</p><p>这一块很多人可能不相信，涉及到很深的心理学知识。与心理暗示、诅咒的原理一样。</p><p>如果不相信自己能够学好，心里潜意识的念头里如果总是：PHP很难，我学不会。那么这个人肯定很难学会。</p><p>把不相信自己能学会的负面情绪和观念给抛掉。</p><p>只要你每天练习代码并相信自己。你肯定能学会，并且能学得很好，代码写的很成功，成为大牛！</p><p>2. 懒</p><p>人的天性有善有恶，而学不好程序的人，身上的一个通病，只有一个字就是————懒！<br/>基本语法，需要去背<br/>函数需要去默写</p><p>3. 自以为是</p><p>一看就会，一写就错。以为自己是神童。</p><p>4. 英文单词</p><p>计算机里面常用的英文单词就那么一些。</p><p>不要找英语的借口。本书会把英语单词都会跟你标注出来。看到不会的，就去翻一翻。</p><p>5. 不坚持</p><p>学着学着就放弃了。</p><p>6. 不去提问，不会提问，不去思考</p><p>解决问题前，先去搜索</p><p>搜索解决不了再去提问</p><p>PHP学院为大家准备了视频，也为大家准备了问答中心。</p><p>大多数的人，不把问题详述清楚，不把错误代码贴完整。</p><p>张嘴就来提问。我想神仙也不知道你的问题是什么吧？问题发出来前。换位思考一下自己看不看得懂这个问题。</p><p>7. 你还需要自我鼓励</p><p>在学习过程中，你会否定自己。其实任何人都会。大多数人都会遇到跟你一样的困难。只不过他们在克服困难，而一些人在逃避困难。</p><p>学累的时候，放松一会儿。再去多读几遍。不断的告诉自己，你就是最棒的！</p><p>学会交流和倾诉而非抱怨，并且不断的自我鼓励</p>', '1', '100', '48', '2019-12-19 18:15:43', '0000-00-00 00:00:00', '未知', '互联网进入到人们生活中的方方面面了，世界首富比尔盖茨多次提到青少年编程，而编程是一种思维习惯的转化。\r\n作为写了10几年程序的人，我听到过一些说编程不好学的抱怨。', '1', '', '1', '1', '1');
INSERT INTO `article` VALUES ('8', '2', '开发环境是什么？', '', '', '', '<p>PHP是一门开发语言。而开发语言写出来的代码，通常需要在指定的软件下才能运行。因此，我们写好的代码需要（运行）显示出来看到，就需要安装这几个软件来运行代码。</p><p>我们把运行我们写代码的几个软件和运行代码的软件统一都可称为开发环境。</p><p>新手学习前常遇到的环境问题</p><p>很多朋友最开始学习的时候，听说某个环境好就安装某些软件。由于缺乏相关知识，所以没有主见。陷入人云即云的怪圈里。今天换这个，明天换那个。</p><p>当前验证真理的唯一标准，请始终保证一点：</p><p>环境能满足你的学习需求。不要在环境上面反复纠结，耽误宝贵的学习时间。</p><p>我们认为环境只要能满足学习要求即可。等学会了后，再去着磨一些更加复杂的互联网线上的、生产环境中的具体配置。</p>', '1', '100', '247', '2019-12-19 18:15:43', '0000-00-00 00:00:00', '未知', 'PHP是一门开发语言。而开发语言写出来的代码，通常需要在指定的软件下才能运行。因此，我们写好的代码需要（运行）显示出来看到，就需要安装这几个软件来运行代码。', '1', '', '1', '2', '1');
INSERT INTO `article` VALUES ('9', '2', 'windows环境安装', '', '', '', '<p>所谓服务器：不要把它想的太过于高深，不过就是提供一项特殊功能（服务）的电脑而已。</p><p>显示网页的叫网页(web)服务器（server）。</p><p>帮我们代为收发电子邮件(Email)的服务器叫邮件服务器。</p><p>帮我们把各个游戏玩家连接在一起的叫游戏服务器。</p><p>帮我们存储数据的叫数据库服务器</p><p>... ...等等</p><p>我们现在使用的一部手机的性能比10年前的一台电脑和服务器的性能还要强劲、给力。</p><p>而我们的学习过程当中完全可以把自己使用的这一台windows电脑作为服务器来使用。</p><p>原来如此，一讲就通了吧？</p><p>我们大多数人使用的电脑通常是windows操作系统的电脑。而我们的讲解主要在windows电脑上进行。</p><p>你不需要去理解所谓高深的电脑知识、操作系统原型等。在这一章节当中，你只需要会安装QQ、杀毒软件一样，点击：下一步、下一步即可完成本章的学习。</p><p>在最开始学习时，我们强烈建议初学者使用集成环境包进行安装。</p><p>什么是集成环境包？</p><p>我们学习PHP要安装的东西有很多。例如：网页服务器、数据库服务器和PHP语言核心的解释器。</p><p>我们可以分开安装各部份，也可以合在一起安装一个集成好的软件。</p><p>将这些合在一起的一个软件我们就叫作：集成环境包。</p><p>这个过程需要修改很多配置文件才能完成。并且每个人的电脑情况，权限，经常容易操作出错。</p><p>很容易因为环境问题影响到心情，我们的学习计划在初期非常绝对化：</p><p>请使用集成环境包完成最开始的学习。</p><p>等你学好PHP NB后，你爱用啥用啥，网上成堆的文章教你配置各种环境。</p><p>选用什么样的集成环境包？</p><p>集成环境包比较多。以下的这些全是各种英文名。只不过代表的是不同集成环境包的名字，不用去深纠。如下所示：</p><p>AppServ</p><p>PHPStudy</p><p>APMserv</p><p>XAMPP</p><p>WAMPServer<br/>... ...等等</p><p>对于我们才入门的学习者来说，选择集成环境包的原则：</p><p>更新快，版本比较新</p><p>操作简单易于上手</p><p>选择项不要过多</p><p>因此，我们下面使用的集成环境包是：PHPstudy。当然，如果你对此块很熟悉了，也可以自行选择选择集成环境包。</p><p>可以以在官方网址下载：<br/>http://www.phpstudy.net/&nbsp;</p><p>也可以在百度中搜索：*PHPstudy *&nbsp;&nbsp;这个5个字文字母进行下载。</p><p>对学习PHP的新手来说，WINDOWS下PHP环境配置是一件很困难的事，就是老手也是一件烦琐的事。因此，无论你是新手还是老手，phpStudy 2016都是一个不错的选择，该程序集成Apache+PHP+MySQL+phpMyAdmin+ZendOptimizer，最新版本已集成最新的&nbsp;PHP7。</p>', '1', '100', '54', '2019-12-19 18:15:43', '0000-00-00 00:00:00', '未知', '所谓服务器：不要把它想的太过于高深，不过就是提供一项特殊功能（服务）的电脑而已。\r\n显示网页的叫网页(web)服务器（server）。', '1', '', '1', '5', '1');
INSERT INTO `article` VALUES ('13', '2', 'php中的变量－读过初中你就会变量', '', '', '', '<p>大家在读初中的时候呀。老师经常会这么教大家。</p>\r\n\r\n<p>请问，李磊和韩梅梅同学，假如：</p>\r\n\r\n<p>x&nbsp;=&nbsp;5<br />\r\ny&nbsp;=&nbsp;6</p>\r\n\r\n<p>那么x + y 等于多少呢？大家会义无反顾的回答。x + y 等于11。</p>\r\n\r\n<p>接下来我们看下面的初中的数学知识，请问x + y 的结果是多少？</p>\r\n\r\n<p>x&nbsp;=&nbsp;5<br />\r\ny&nbsp;=&nbsp;6<br />\r\nx&nbsp;＝&nbsp;8</p>\r\n\r\n<p>我估计大家也会义无反顾的回答：x + y 的结果为14。</p>\r\n\r\n<p>这就是变量！</p>\r\n\r\n<p>变量的几个特点：</p>\r\n\r\n<p>1.x = 5 将右边值5，赋值给左边的x</p>\r\n\r\n<p>2.第二段x ＝ 8，最后x + y 的结果等于14，说明x在从上到下的运算（执行）中，可以被重新赋值。</p>\r\n\r\n<p>我们在PHP中的变量也是如此。不过有几个特点：</p>\r\n\r\n<p>1.必须要以$开始。如变量x必须要写成$x</p>\r\n\r\n<p><img alt=\"\" src=\"/static/upload/article_images/2019/12/19/142be81aae5eaa74818acb34f7fe841b.jpg\" style=\"height:426px; width:640px\" /></p>\r\n\r\n<p>2.变量的首字母不能以数字开始</p>\r\n\r\n<p>3.变量的名字区分大小写</p>\r\n\r\n<p>4.变量不要用特殊符号、中文，_不算特殊符号</p>\r\n\r\n<p>5.变量命名要有意义（别写xxx，aaa，ccc这种 变量名）</p>\r\n\r\n<p>错误举列：</p>\r\n\r\n<p>错误：变量以数字开始</p>\r\n\r\n<pre>\r\n<code class=\"language-php\">&lt;?php\r\n$123 = 345;\r\n?&gt;</code></pre>\r\n\r\n<p>错误：变量中有特殊字符，中文</p>\r\n\r\n<p>&lt;?php<br />\r\n//$a*d&nbsp;=&nbsp;345;<br />\r\n<br />\r\n//$中国&nbsp;=&nbsp;123;<br />\r\n?&gt;</p>\r\n\r\n<p>错误：变量命名没有意义aaa容易数错，也没有含意</p>\r\n\r\n<p>&lt;?php<br />\r\n$aaaaaaa&nbsp;=&nbsp;345;<br />\r\n?&gt;</p>\r\n\r\n<p>错误：变量严格区分大小写 $dog 和 $Dog是PHP学院的变量,尝试将$dog的值改为8.结果D写成了大写。</p>\r\n\r\n<p>&lt;?php<br />\r\n$dog&nbsp;=&nbsp;5;<br />\r\n//重新修改$dog的值，将$dog改为8<br />\r\n$Dog&nbsp;=&nbsp;8;<br />\r\n?&gt;</p>\r\n\r\n<p>正确举例：</p>\r\n\r\n<p>正确：变量不能以数字开始,但是数字可以夹在变量名中间和结尾</p>\r\n\r\n<p>&lt;?php<br />\r\n$iphone6&nbsp;=&nbsp;5880;<br />\r\n$iphone6plus&nbsp;=&nbsp;6088;<br />\r\n?&gt;</p>\r\n\r\n<p>正确：变量不能有特殊符号，但是_(下划线不算特殊符号)</p>\r\n\r\n<p>&lt;?php<br />\r\n$_cup&nbsp;=&nbsp;123;<br />\r\n?&gt;</p>\r\n\r\n<p>注：你会发现代码是从上向下执行的。</p>\r\n\r\n<p>$ 叫作美元符，英文单词：dollar。PHP的变量必须以美元符开始。说明搞PHP有&ldquo;钱&rdquo;途。</p>\r\n\r\n<p>dollar<br />\r\n读音：[&#39;dɒlə(r)]<br />\r\n解释：美元</p>\r\n\r\n<p>&nbsp;</p>', '1', '100', '6', '2019-12-19 18:15:43', '2019-12-19 18:58:36', '未知', '大家在读初中的时候呀。老师经常会这么教大家。\r\n请问，李磊和韩梅梅同学，假如：', '1', '', '1', '0', '1');
INSERT INTO `article` VALUES ('10', '2', 'Linux环境安装', '', '', '', '<p>这一个章节是本书中永远不会写的一个章节，很多人被一些市面上的书籍误导，认为学习PHP前要学习Linux。结果，一看Linux，就对人生和学习失去了希望。我们作为有过10年以上开发经验和内部训经验的专业人士告戒各位：</p><p>Linux学习与PHP学习没有必然的联系，这是两个不同的知识体系。</p><p>作为有多年开发经验和教学经验的我们。</p><p>我们强烈不建议没有接触过Linux的学生，为了学习PHP而去安装Linux环境</p><p>如果您有经验，我们相信你一定能解决，如果解决不了。</p><p>请加QQ群和访问官网：PHP中文网&nbsp;学习视频和提问。</p>', '1', '100', '28', '2019-12-19 18:15:43', '0000-00-00 00:00:00', '未知', '这一个章节是本书中永远不会写的一个章节，很多人被一些市面上的书籍误导，认为学习PHP前要学习Linux。结果，一看Linux，就对人生和学习失去了希望。我们作为有过10年以上开发经验和内部训经验的专业人士告戒各位：', '1', '', '1', '0', '1');
INSERT INTO `article` VALUES ('11', '2', '其他开发环境', '', '', '', '<p>对本章不感兴趣，可以略过，只是介绍和说明。</p><p>其他开发环境有很多：</p><p>1，比如 苹果电脑的系统 Mac os</p><p>2，比如 &nbsp;在线环境（你使用了百度、新浪、阿里等云计算环境）</p><p>3，其他更多... ...</p><p>当然，你甚至可以使用安卓手机和苹果手机来部署你的开发环境。就像有些人可以在各种复杂的环境，甚至U衣酷的试衣间里M..L。我想，这应该不是正常人类该进行的尝试吧。</p><p>如果你在使用这些环境遇到了问题，相信你已经有过一定的开发经验和处理问题的经验了，这不是刚开始学习编程该掌握的内容。</p><p>但是，如果你真遇到了这些问题。你可以上PHP中文网来提问。</p>', '1', '100', '27', '2019-12-19 18:15:43', '0000-00-00 00:00:00', '未知', '对本章不感兴趣，可以略过，只是介绍和说明。\r\n其他开发环境有很多：\r\n1，比如 苹果电脑的系统 Mac os\r\n2，比如  在线环境（你使用了百度、新浪、阿里等云计算环境）\r\n3，其他更多... ...', '1', '', '1', '1', '1');
INSERT INTO `article` VALUES ('12', '2', '写代码的工具选择', 'static/upload/article_thumb/83e73904541200161baf46ffcf1b1c96.jpg', '写代码的工具选择', '写代码的工具选择', '<p>写代码的工具有很多。对于刚开始学习PHP的朋友来说。选择工具有几个原则：<img alt=\"\" src=\"/static/upload/article_images/2019/12/19/06bcf3e210e233b6bccc7bdda0d13f08.png\" /></p>\r\n\r\n<p>1，不要使用带自动提示的工具（例如eclipse、zend studio等PHP开发工具集）</p>\r\n\r\n<p>2，写完的代码必须要有颜色高亮显示。（不能使用：txt文本编辑器等无代码颜色显示的编辑器）</p>\r\n\r\n<p>你可能想问，为什么呀？</p>\r\n\r\n<p>我们发现电视、电影和现实生活中的编程高手，噼里哗啦就写一堆代码，一点都不报错，点击就能运行。而我们对着他们的代码抄袭反倒抄错。这种感觉特别不好！！！</p>\r\n\r\n<p>&mdash;&mdash;传说中的这些高手，他们都曾经在基础代码上反复练习过，所以他们不会写错。</p>\r\n\r\n<p>而我们需要高手之境界，在学习初期就不能使用先进的工具。这样会浪费我们保贵的练习代码的机会、调试错误的机会。</p>\r\n\r\n<p>因为先进的编辑器通常有很多先进的功能，例如：</p>\r\n\r\n<p>代码自动显示错误</p>\r\n\r\n<p>代码自动换行</p>\r\n\r\n<p>这些先进的工具，对于开始入门学习的你，不利于新手产生独立解决问题的能力！</p>\r\n\r\n<p>推荐的开发工具</p>\r\n\r\n<p>1. NotePad++&nbsp;</p>\r\n\r\n<p>https://notepad-plus-plus.org/&nbsp;由于某些不可抗的原因，请使用百度搜索NotePad++&nbsp;</p>\r\n\r\n<p>2.phpstorm（强烈推荐）</p>\r\n\r\n<p>https://www.jetbrains.com/phpstorm/&nbsp;</p>\r\n\r\n<p>这些工具，你只需要下载下来，一直点击下一步，安装到你的电脑上即可。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>库</p>\r\n\r\n<p>您的浏览器不支持video播放</p>\r\n\r\n<p>您的浏览器不支持video播放</p>', '1', '100', '37', '2019-12-19 18:15:43', '2019-12-19 15:38:05', '未知', '写代码的工具有很多。对于刚开始学习PHP的朋友来说。选择工具有几个原则：\r\n1，不要使用带自动提示的工具（例如eclipse、zend studio等PHP开发工具集）\r\n2，写完的代码必须要有颜色高亮显示。（不能使用：txt文本编辑器等无代码颜色显示的编辑器）', '1', '1', '1', '2', '1');
INSERT INTO `article` VALUES ('14', '2', 'echo 显示命令', '', '', '', '<p>echo 是在PHP里面最常用的一个输出、显示功能的命令。</p><p>我们可以让他显示任何可见的字符。</p><p>&lt;?php<br/><br/>echo&nbsp;123;<br/><br/>?&gt;<br/>&lt;?php<br/><br/>$iphone&nbsp;=&nbsp;6088;<br/><br/>echo&nbsp;$iphone;<br/><br/>?&gt;<br/></p><p>你可以对着做做实验。等下一章，我们讲数据类型的时候，我教大家输出中文和用PHP显示网页内容。</p><p>单词：</p><p>*echo *&nbsp;读音： [&#39;ekoʊ]<br/>解释：发出回声；回响。<br/>功能解释：输出、显示</p>', '1', '100', '0', '2019-12-19 18:15:43', '0000-00-00 00:00:00', '未知', 'echo 是在PHP里面最常用的一个输出、显示功能的命令。\r\n我们可以让他显示任何可见的字符。', '2', '', '1', '0', '1');
INSERT INTO `article` VALUES ('15', '2', 'php注释的学习', 'static/upload/article_thumb/fa9e6517d3b4f866c74a05c692a76116.png', '注释', '注释的功能很强大', '<p>注释的功能很强大</p>\r\n\r\n<p>所谓注释，汉语解释可以为：注</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\nfunction navigate_admin()\r\n{\r\n    $navigate = include APP_PATH.&#39;Common/Conf/navigate.php&#39;;\r\n    $location = strtolower(&#39;Admin/&#39;.CONTROLLER_NAME);\r\n    $arr = array(\r\n        &#39;后台首页&#39;=&gt;&#39;javascript:void();&#39;,\r\n        $navigate[$location][&#39;name&#39;]=&gt;&#39;javascript:void();&#39;,\r\n        $navigate[$location][&#39;action&#39;][ACTION_NAME]=&gt;&#39;javascript:void();&#39;,\r\n    );\r\n    return $arr;\r\n}</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>您的浏览器不支持video播放</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>因为代码是英文的、并且代码很长，时间长了人会忘。<br />\r\n所以我们会加上注释。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>注释的功能有很多：</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;1.对重点进行标注</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;2.时间长了容易忘快速回忆，方便查找</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;3.让其他人看的时候快速看懂</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;4.还可以生成文档，代码写完相关的文档就写完了，提高工作效率</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;5.注释、空行、回车之后的代码看起来更优美</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;6.注释可用来排错。不确定代码中哪一块写错了，可以将一大段注释，确定错误区间</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;7.注释中间的部份的内容，电脑不会执行它</p>\r\n\r\n<p>先给大家看看我们觉得优美的代码，整齐、规范、说明清楚、一看就懂。（不需要理解代码的含义）：</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>再看看我们眼中觉得丑陋的代码，对齐丑陋不说，并且没有功能说明（不需要理解代码的含义）：</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>我们了解了注释的好处，接下来我们来说PHP的注释，注释分别：</p>\r\n\r\n<p>单行注释（只注释一行）</p>\r\n\r\n<p>多行注释（注释多行）</p>\r\n\r\n<p>单行注释</p>\r\n\r\n<p>//&nbsp;&nbsp;&nbsp;表示单行注释<br />\r\n#&nbsp;&nbsp;&nbsp;&nbsp;#号也表示单行注释，用的比较少</p>\r\n\r\n<p>多行注释</p>\r\n\r\n<p>/*&nbsp;<br />\r\n多行注释&nbsp;这里是注释区域代码<br />\r\n&nbsp;*/</p>\r\n\r\n<p>单行注释举例：</p>\r\n\r\n<p><!--?php <br--><br />\r\n//声明一部iphone6手机的价格变量</p>\r\n\r\n<p><br />\r\n$iphone6_price&nbsp;=&nbsp;6088;<br />\r\n<br />\r\n//显示输出手机价格<br />\r\necho&nbsp;$iphone6_price;<br />\r\n?&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>注：通过上例我们知道，注释通常写代码上面。</p>\r\n\r\n<p>多行注释举例：</p>\r\n\r\n<p><!--?php <br-->/*<br />\r\n作者：PHP中文网<br />\r\n时间：2048.12.23<br />\r\n功能：这是一个假的多行注释的例子<br />\r\n*/<br />\r\n<br />\r\n/*<br />\r\n&nbsp;&nbsp;声明一个爱情变量<br />\r\n&nbsp;&nbsp;$love&nbsp;是指爱情<br />\r\n&nbsp;&nbsp;爱情是一个变量，因为人的爱总是在发生变化<br />\r\n&nbsp;&nbsp;所以，爱情变量的值为250<br />\r\n*/<br />\r\n$love&nbsp;=&nbsp;250;<br />\r\n<br />\r\n?&gt;</p>\r\n\r\n<p>注：通过上面的例子我们发现，我们要写上很多注释的时候，释用多行注释。</p>\r\n\r\n<p style=\"text-align:center\">注：暂进不讲解如何通过专门的工具生成注释</p>\r\n\r\n<p>&nbsp;</p>', '1', '100', '97', '2019-12-19 18:15:43', '2019-12-19 19:03:26', '', '注释的功能很强大\r\n所谓注释，汉语解释可以为：注解。更为准确一些。\r\n因为代码是英文的、并且代码很长，时间长了人会忘。', '2', '', '1', '3', '1');
INSERT INTO `article` VALUES ('16', '2', 'php整型就是整数', '', '', '', '<p>我&nbsp; &nbsp;一直在讲，不要被名词的含义所吓唬住。</p><p>到底什么是整型呀？</p><p>所谓整型，就是大家数学中所学的整数。</p><p>整型——整数也，英文称之:integer。英文简写：int</p><p>整型分为：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;1.10进行</p><p>&nbsp;&nbsp;&nbsp;&nbsp;2.8进制 （了解，基本不用）</p><p>&nbsp;&nbsp;&nbsp;&nbsp;3.16进制（了解，基本不用）</p><p>整型（整数）在计算机里面是有最大值和最小值范围的。</p><p>【了解知识点，开发中不常用】大家经常听说32位计算机，也就是32位计算机一次运算处理的最大范围为-232至232-1。<br>64位计算机呢？——</p><p>10 进制声明：</p><p>&lt;?php<br>//为了方便大家记忆和前期学习，英文不好的朋友也可用拼音来声明变量。以后再用英文来声明变量也无所谓<br>//声明变量&nbsp;整数，英文&nbsp;int<br>//$int&nbsp;=&nbsp;1000;<br>$zhengshu&nbsp;=&nbsp;1000;<br>echo&nbsp;$zhengshu;<br>?&gt;<br></p><p>8进制声明：&nbsp;以0开始，后面跟0-7的整数（了解知识点）</p><p>&lt;?php<br>//8进制的取值范围最大为0-7,即0,1,2,3,4,5,6,7<br><br>$bajingzhi&nbsp;=&nbsp;&nbsp;033145;<br>echo&nbsp;$bajingzhi;<br><br>?&gt;<br></p><p>16进制声明：&nbsp;以0x开始，后面跟0-f的，0x的abcdef不区分大小写。（了解知识点）</p><p>&lt;?php<br>//16进制的取值范围最大为0-f,即0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f<br>$shiliu&nbsp;=&nbsp;&nbsp;0x6ff;<br>echo&nbsp;$shiliu;<br>?&gt;<br></p><p>本章学习重点，学会如何声明10制制整数即可。了解8制制和16进制的声明，实在不会也不要紧。</p><p>思维误区：容易去考虑8进制和16进制到底是怎么产生的。</p><p><br></p>', '1', '100', '5', '2019-12-19 18:15:43', '0000-00-00 00:00:00', '未知', '我一直在讲，不要被名词的含义所吓唬住。\r\n到底什么是整型呀？\r\n所谓整型，就是大家数学中所学的整数。', '2', '', '1', '0', '1');
INSERT INTO `article` VALUES ('18', '2', 'php流程控制之if条件结构流程', 'static/upload/article_thumb/06bcf3e210e233b6bccc7bdda0d13f08.png', '123', '456', '<p>if条件结构流程<img alt=\"\" src=\"/static/upload/article_images/2019/12/19/621d2cf94db67cb397b0a6f8b99fecb5.jpg\" style=\"height:120px; width:120px\" /></p>\r\n\r\n<pre>\r\n<code class=\"language-javascript\">function myFun(sId) {\r\n  var oImg = document.getElementsByTagName(\'img\');\r\n  for (var i = 0; i &lt; oImg.length; i++) {\r\n     if (oImg[i].id == sId) {\r\n        oImg[i].previousSibling.previousSibling.checked = true;\r\n        oImg[i].style.opacity = \'1\';\r\n     } else {\r\n       oImg[i].style.opacity = \'.8\';\r\n     }\r\n  }\r\n}</code></pre>\r\n\r\n<p>if和else 语句，<img alt=\"laugh\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/teeth_smile.png\" style=\"height:23px; width:23px\" title=\"laugh\" />在之前的3.2.5章节中已经做了说明。我们配合王思总同学的例子，再次进行说明，方便大家对此章节的理解。</p>\r\n\r\n<p>本章的知识点为：【默写级】</p>\r\n\r\n<pre>\r\n<code class=\"language-python\">urlpatterns = [\r\n    path(\'admin/\', admin.site.urls),\r\n    re_path(r\'^\', include(\'blog.urls\')),\r\n    url(r\'^ckeditor/\',include(\'ckeditor_uploader.urls\')),\r\n    url(r\'^$\', views.index),\r\n    url(r\'^static/(?P&lt;path&gt;.*)$\',static.serve,\r\n        {\'document_root\':settings.STATIC_ROOT},name=\'static\'),\r\n]</code></pre>\r\n\r\n<p>基本语法，不能有半点马乎，完全是语法规范规定的，不这么写就错！</p>\r\n\r\n<pre>\r\n<code class=\"language-php\">&lt;?php \r\n$week=date(\"4\");\r\n//判断星期小于6，则输出：还没到周末，继续上班.....\r\nif ($week&lt;\"6\") {\r\n    echo \"还没到周末，继续上班.....\";\r\n} \r\n?&gt;</code></pre>\r\n\r\n<p>在之前我们也讲过，因此if的结构可以根据人类思维推理出来两种结构：</p>\r\n\r\n<p><img alt=\"\" src=\"/static/upload/article_images/2019/12/19/a0a7180bd9659c7ab644ff88319d5536.png\" style=\"height:355px; width:640px\" /></p>\r\n\r\n<p>//if单行判断<br />\r\nif(布尔值判断)<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;只写一句话;<br />\r\n后续代码<br />\r\n//if多行判断<br />\r\nif(布尔值判断){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;可以写多句话;<br />\r\n}</p>\r\n\r\n<p><img alt=\"\" src=\"/static/upload/article_images/2019/12/19/c64f62348f62bf61a6577c48cf58f34c.jpg\" style=\"height:426px; width:640px\" /><br />\r\n后续代码</p>\r\n\r\n<p><img alt=\"\" src=\"/static/upload/article_images/2019/12/19/60161560b61ebf7082b32f3ac96281f1.jpg\" style=\"height:500px; width:500px\" /></p>\r\n\r\n<pre>\r\n<code class=\"language-php\">public function index(){\r\n        $message = M::where([\'status\'=&gt;0])-&gt;order(\'create_time desc\')-&gt;select();\r\n\r\n        $this-&gt;assign(\'message\',$message);\r\n        //网站seo部分\r\n        $this-&gt;assign(\'web_info\',get_webinfo(\'留言板\'));\r\n        return view();\r\n    }</code></pre>\r\n\r\n<p>&nbsp;</p>', '1', '100', '0', '2019-12-19 18:15:43', '2019-12-19 17:48:07', '未知', 'if条件结构流程\r\nif和else 语句，在之前的3.2.5章节中已经做了说明。我们配合王思总同学的例子，再次进行说明，方便大家对此章节的理解。\r\n本章的知识点为：【默写级】', '2', '1', '1', '1', '1');
INSERT INTO `article` VALUES ('23', '1', '关于我', '/uploads/Thumb/20190917/06bcf3e210e233b6bccc7bdda0d13f08.png', '宝宝个人博客,成长博客,个人博客,相册博客', '宝宝个人成长博客,记录宝宝生活、学习、成长的点点滴滴。', '<p><strong>About my develop</strong></p>\r\n\r\n<p>袁威，汉纸，爱文字、爱音乐的90后伪文艺程序猿一枚，分享一些个人开发之路上踩的各种坑，只为后来人更好的行走。 PHP3年+开发经验，熟悉ThinkPHP和laravel框架，有微信公众号第三方平台、微信公众号、微信小程序等开发经验，以及其他php相关开发经验（如支付宝，微信，翼支付等支付功能对接开发，api接口开发，网站前后端开发等）。</p>\r\n\r\n<p><strong>&nbsp;About my music</strong></p>\r\n\r\n<p>2012年的7月5日，第一张音乐专辑《微时光》正式上线百度音乐，每一首歌曲都是在寝室里用电脑制作完成。 2012年10月，与杭州百全文艺策划有限公司签署了分享合约。 从2008年到2012年总共写了一百多首词，演唱的有20多首，不懂乐谱不会编曲，所以曾被不少人质疑&mdash;&mdash;&ldquo;外行人玩音乐不会有前途&rdquo;。 直到现在，仍不懂乐谱，&ldquo;自学很难，要别人教学费又贵。&rdquo;因此选择了最&ldquo;原始&rdquo;的创作方法：作词之后用电脑将自己哼唱的旋律录下来，让会编曲的同学改编成伴奏后，再学会演唱，《一光年》就是这样做成的。&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/static/upload/article_images/2019/12/19/2940284fe9f7ac859a226c77ed255ad6.jpg\" style=\"height:433px; width:640px\" /></p>', '1', '100', '0', '2019-12-19 18:15:43', '2019-12-19 19:05:56', 'Admin', '关于我', '2', '', '1', '0', '1');
INSERT INTO `article` VALUES ('26', '3', '【音乐】周杰伦新歌《说好不哭》2', 'static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536_FQ8uCVJ.png', '周杰伦,说好不哭', '周杰伦新歌《说好不哭》', '<p>&nbsp;</p>\r\n\r\n<p>您的浏览器不支持video播放</p>\r\n\r\n<p>&nbsp;</p>', '1', '100', '900', '2019-12-19 18:15:43', '2019-12-19 19:04:03', 'Admin', '周杰伦新歌《说好不哭》', '2', 'static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png,static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png,static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png,static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png,static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png,static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png', '1', '2', '1');
INSERT INTO `article` VALUES ('27', '3', '【开启时光】我的个人博客，是我的小家，也是我的时光机', 'static/upload/article_thumb/7e9cc8f50850d4a5f7f9581c432dc1b5.png', '个人博客，是我的小家，也是我的时光机', '【开启时光】我的个人博客，是我的小家，也是我的时光机', '<p><img alt=\"blush\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/embarrassed_smile.png\" style=\"height:23px; width:23px\" title=\"blush\" />我叫小不点，这是我的个人博客，也是我的小家，他也是一个时光机。爸爸妈妈在上面记录我成长的点滴，人生虽百味，但我的个人博客记录的都是一些欢乐时光，虽然这其中参杂了不少爸爸妈妈的焦虑，伴随我成长的同时，我知道，他们也在成长。就让这个博客做个见证吧，我们要做快乐的一家人。</p>', '1', '100', '70', '2019-12-19 18:15:43', '2019-12-19 19:02:24', 'Admin', '这是我的个人博客，也是我的小家，它也是一个时光机。爸爸妈妈在上面记录我成长的点滴，人生虽百味，但我的个人博客记录的都是一些欢乐时光，虽然这其中参杂了不少爸爸妈妈的焦虑，伴随我成长的同时，我知道，他们也在成长。就让这个博客做个见证吧，我们要做快乐的一家人。', '2', 'static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png,static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png,static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png,static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png,static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png,static/upload/article_thumb/a0a7180bd9659c7ab644ff88319d5536.png', '2', '8', '1');

-- ----------------------------
-- Table structure for `article_praise_log`
-- ----------------------------
DROP TABLE IF EXISTS `article_praise_log`;
CREATE TABLE `article_praise_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '点赞时间',
  `ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='点赞记录表';

-- ----------------------------
-- Records of article_praise_log
-- ----------------------------

-- ----------------------------
-- Table structure for `cate`
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `catname` char(100) NOT NULL COMMENT '栏目名称',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态（前后台状态）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of cate
-- ----------------------------
INSERT INTO `cate` VALUES ('1', '关于我', '1');
INSERT INTO `cate` VALUES ('2', '我的日记', '1');
INSERT INTO `cate` VALUES ('3', '我的相册', '1');

-- ----------------------------
-- Table structure for `link`
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '网站名称',
  `url` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(255) DEFAULT NULL COMMENT '网站logo',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort` mediumint(8) DEFAULT '50' COMMENT '排序',
  `status` int(1) DEFAULT '0' COMMENT '状态（1 正常，0 锁定）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('2', '袁小威', 'https://www.yxiaowei.com', '/uploads/Thumb/20190917/976acfcc85aa69e4eedf8e6d56ffe980.jpg', '', '1', '1', '2019-12-02 15:43:28', '2019-12-10 15:43:34');
INSERT INTO `link` VALUES ('5', '袁小威开放平台', 'https://www.yxiaowei.com/docs', '', '', '2', '1', '2019-12-02 15:43:25', '2019-12-11 15:43:38');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `mycall` varchar(225) DEFAULT '' COMMENT '头像',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态 ，0-正常，1-待审',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `replay_content` text COMMENT '回复内容',
  `replay_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '回复时间',
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`) USING BTREE,
  KEY `catid` (`id`,`status`) USING BTREE,
  KEY `sort` (`id`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `system`
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` int(8) unsigned NOT NULL,
  `name` char(100) NOT NULL DEFAULT '' COMMENT '网站名称',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '网址',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `key` varchar(200) NOT NULL COMMENT '关键字',
  `des` varchar(200) NOT NULL COMMENT '描述',
  `bah` varchar(100) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(200) DEFAULT NULL COMMENT 'copyright',
  `address` varchar(120) DEFAULT NULL COMMENT '公司地址',
  `contacts` varchar(255) DEFAULT NULL COMMENT '联系人',
  `mobile_phone` varchar(100) DEFAULT NULL COMMENT '手机',
  `birthday` varchar(100) DEFAULT NULL COMMENT '传真',
  `tel` varchar(100) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(50) DEFAULT NULL COMMENT '公司邮箱',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `logo` varchar(120) DEFAULT NULL COMMENT 'logo',
  `qrcode` varchar(255) DEFAULT NULL COMMENT '二维码',
  `mobile` tinyint(2) DEFAULT '0' COMMENT '是否开启手机端 1 开启0 关闭',
  `code` tinyint(2) DEFAULT '0' COMMENT '是否开启后台验证码 1 开启 0 关闭',
  `message_code` tinyint(2) DEFAULT '0' COMMENT '是否开启前台验证码 1 开启 0 关闭',
  `message_send_mail` tinyint(2) DEFAULT '0' COMMENT '留言是否发送邮件',
  `template` varchar(200) DEFAULT NULL COMMENT '模版选择',
  `html` varchar(200) DEFAULT NULL COMMENT 'Html目录',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES ('1', '小不点の博客', 'https://baby.yxiaowei.com', '宝宝个人成长博客', '宝宝个人博客,成长博客,个人博客,相册博客', '宝宝个人成长博客,记录宝宝生活、学习、成长的点点滴滴。', '蜀ICP备18031108号-1', 'Copyright © baby个人成长博客 2019.All right reserved.Powered by <a href=\"https://www.yxiaowei.com\" target=\"_blank\">袁小威</a>', '中国·成都', '袁小威', '13888888888', '2015-06-09', '028-918 918', 'yuanwei@yxiaowei.com', '123456789', 'static/upload/system/621d2cf94db67cb397b0a6f8b99fecb5_PQHspHV.jpg', 'static/upload/system/b88c3ea52673d545f38ad53e645543fe.jpg', '0', '1', '1', '1', 'default', 'html');
