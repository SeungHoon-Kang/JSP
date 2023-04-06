-- 회원가입한 회원들의 정보를 담은 "USER테이블 생성"
CREATE TABLE "USER"(
	userid		varchar2(300) PRIMARY KEY,
	userpw		varchar2(300),
	username	varchar2(300),
	userphone	varchar2(300),
	zipcode		varchar2(100),
	addr		varchar2(300),
	addrdetail	varchar2(1000),
	addretc		varchar2(500)
);

INSERT INTO "USER" values('admin34', 'admin123', '홍길동', '01012345678','10101', '서울시', '송파구', '(잠실동)');
SELECT * FROM "USER" u ;

--게시판 테이블
CREATE TABLE tbl_board(
	boardnum		number(10) PRIMARY KEY,
	boardtitle		varchar2(300),
	boardcontents	varchar2(4000),
	username		varchar2(300),
	boarddate		DATE,
	boardreadcount	number(10)
);


CREATE SEQUENCE board_seq
INCREMENT BY 1
START WITH 1;

INSERT INTO TBL_BOARD VALUES (board_seq.nextval, '태dd스트제목', '테스트ddd내gg용', 'gg태스트작성자', SYSDATE, 0);

SELECT  * FROM tbl_board;

SELECT count(*) FROM TBL_BOARD tb ;

-- 게시판 페이징 처리하기
--row넘버를 기준으로 10건씩 자를 것이다
--서브쿼리안에서브쿼리안에서브쿼리(이게 최종 페이징 처리하는 부분에 넣을 것이며 where 구문의 41,50부분을 변수로 넣을 것)
SELECT * from(
			SELECT rownum r, A.* FROM (SELECT * FROM TBL_BOARD tb 
										ORDER BY BOARDNUM DESC 
										) A
		) B
WHERE B.r BETWEEN 41 and 50
;


UPDATE TBL_BOARD  SET boardreadcount = boardreadcount+1
WHERE boardnum = 2 ;


-- 댓글 쓰는 칸 추가
CREATE TABLE tbl_reply(
	replynum		number(10) PRIMARY KEY,
	replycontents	varchar2(600),
	username		varchar2(300),
	password		varchar2(300),
	boardnum		number(10),
	CONSTRAINT rep_bd_fk FOREIGN key(boardnum) REFERENCES tbl_board(boardnum)
);

CREATE SEQUENCE reply_seq
START WITH 1
INCREMENT BY 1
nocache
; 

INSERT INTO tbl_reply VALUES (reply_seq.nextval, '태dd스트내용', '테스트d작성자', '태스트비밀ㅈ벟로', 1);
-- 댓글 끝





-- 판매할 상품 리스트 테이블
CREATE TABLE itemlist(
	itemname	varchar2(300) PRIMARY key,
	price		varchar2(300),
	explain		varchar2(1000),
	spec		varchar2(100),
	size1		varchar2(300),
	size2		varchar2(300),
	size3		varchar2(300),
	imgnumber	number(10)
);


CREATE SEQUENCE itemnumber_seq
START WITH 1
INCREMENT BY 1
nocache
; 


INSERT INTO itemlist VALUES ('고구마 가득 씰스티커', '2300원','가을에 잘 어울리는 고구마 씰스티커에요!<br>고구마 침낭이 따뜻해보이죠?❤️‍🔥<br>', '무광 유포지' ,'65 x 150 mm', NULL, NULL, itemnumber_seq.nextval);
INSERT INTO itemlist VALUES ('달콤딸기 씰스티커', '2300원','3월 신상 공개✧･ﾟ: *✧･ﾟ:*<br>첫 번째 신상은 "달콤딸기" 입니다!<br>그냥 먹어도 맛있지만 생크림과 먹는 딸기는 더 달콤하고 맛있는 거 같아요😋<br>', '무광 유포지' ,'65 x 150 mm', NULL, NULL, itemnumber_seq.nextval);
INSERT INTO itemlist VALUES ('뜨개질 씰스티커', '2300원','3월 신상 공개✧･ﾟ: *✧･ﾟ:*<br>네 번째 신상은 "뜨개질"입니당<br>포근포근 니트는 사랑이에요😆<br>', '무광 유포지' ,'65 x 150 mm', NULL, NULL, itemnumber_seq.nextval);
INSERT INTO itemlist VALUES ('레모네이드 씰스티커', '2300원','3월 신상 공개✧･ﾟ: *✧･ﾟ:*<br>세 번째 신상은 "레모네이드"!<br>한입 베어 문 레몬 너무 귀여워요😆<br>', '무광 유포지' ,'65 x 150 mm', NULL, NULL, itemnumber_seq.nextval);
INSERT INTO itemlist VALUES ('모조지 세트 (총 10매)', '2200원','총 10매(5종x2매)로 구성된 set 상품입니다.<br>⚠️하트 거울 모조지 1mm 칼선 밀림있습니다.', NULL,'약 80x80 mm', '약 95x55 mm', NULL, itemnumber_seq.nextval);
INSERT INTO itemlist VALUES ('미술시간 씰스티커', '2300원',' ⭐️트웬티폼 10월 4일 open⭐<br>️알록달록 네번째 씰스티커🎨🎨<br>첫 마켓 오픈하기 전부터 생각했던 도안을 이제 공개하게 됐어요😆<br>뽀짝한 나봉이 찾아보세요<br>️', '무광 유포지' ,'65 x 150 mm', NULL, NULL, itemnumber_seq.nextval);
INSERT INTO itemlist VALUES ('선물포장 씰스티커', '2300원',' ⭐️트웬티 폼 10월 4일 open⭐<br>️이제야 올리는 신상 첫 개별 사진이에요🥲<br>선물포장 씰스티커(배이비 ver.)입니당💕<br>선물 상자 모조지와 세트에요~!<br>', '무광 유포지' ,'65 x 150 mm', NULL, NULL, itemnumber_seq.nextval);
INSERT INTO itemlist VALUES ('수박 화채 떡 메모지', '1500원','수박 화채 떡 메모지<br>', '무광 유포지' ,'90 x 90 mm', '50매 내외', NULL, itemnumber_seq.nextval);
INSERT INTO itemlist VALUES ('쥬스 데코 스티커 세트(3매)', '1500원','<p>총 3매로 구성된 세트 상품입니다.<br>', '유광 pvc캘지' ,'150 x 40 mm', NULL, NULL, itemnumber_seq.nextval);
INSERT INTO itemlist VALUES ('캠핑이 좋아 씰스티커', '2300원','⭐️트웬티폼 10월 4일 open⭐<br>️두번째 스티커 테마는 캠핑이에요.<br>구워지고 있는 마시멜로 표정을 봐주세요😆<br>', '무광 유포지' ,'65 x 150 mm', NULL, NULL, itemnumber_seq.nextval);
INSERT INTO itemlist VALUES ('튤립가든 씰스티커', '2300원','3월 신상 공개✧･ﾟ: *✧･ﾟ:*<br>두 번째 신상은 "튤립가든"이에요🌷<br><br>튤립은 색이 정말 다양한데,<br>저는 주황색이 제일 예뻐 보이더라구요!<br>예쁜 튤립 가득한 가든으로 놀러 오세요🧡<br>', '무광 유포지' ,'65 x 150 mm', NULL, NULL, itemnumber_seq.nextval);

SELECT  * FROM itemlist;

--DROP TABLE itemlist;
--TRUNCATE TABLE itemlist;