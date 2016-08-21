CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `seq` int(11) DEFAULT '1',
  `name` varchar(300) DEFAULT '',
  `shortcut` varchar(300) DEFAULT '' COMMENT '메모장 서브메뉴 단축키 표시부분',
  `url` varchar(50) DEFAULT '',
  `line_yn` enum('n','y') DEFAULT 'n' COMMENT '구분선 여부',
  `disable_yn` enum('n','y') DEFAULT 'n' COMMENT '비활성화 여부',
  `del_yn` enum('n','y') DEFAULT 'n' COMMENT '삭제 여부',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='메뉴 관리 테이블';


