PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO "schema_migrations" VALUES('20180305120421');
INSERT INTO "schema_migrations" VALUES('20180307052750');
INSERT INTO "schema_migrations" VALUES('20180307070242');
INSERT INTO "schema_migrations" VALUES('20180307100232');
INSERT INTO "schema_migrations" VALUES('20180307101532');
INSERT INTO "schema_migrations" VALUES('20180307101533');
INSERT INTO "schema_migrations" VALUES('20180307122415');
INSERT INTO "schema_migrations" VALUES('20180307122416');
INSERT INTO "schema_migrations" VALUES('20180308050029');
INSERT INTO "schema_migrations" VALUES('20180309063033');
INSERT INTO "schema_migrations" VALUES('20180310102648');
INSERT INTO "schema_migrations" VALUES('20180311101648');
INSERT INTO "schema_migrations" VALUES('20180311113738');
INSERT INTO "schema_migrations" VALUES('20180311113914');
INSERT INTO "schema_migrations" VALUES('20180311131134');
INSERT INTO "schema_migrations" VALUES('20180313043440');
INSERT INTO "schema_migrations" VALUES('20180314113025');
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "ar_internal_metadata" VALUES('environment','development','2018-03-05 12:10:36.072787','2018-03-05 12:10:36.072787');
CREATE TABLE "users" ("id" integer NOT NULL PRIMARY KEY, "type" varchar DEFAULT 'User', "name" varchar DEFAULT NULL, "email" varchar DEFAULT NULL, "password_digest" varchar DEFAULT NULL, "gender" varchar DEFAULT NULL, "dateofbirth" date DEFAULT NULL, "telephone" integer DEFAULT NULL);
INSERT INTO "users" VALUES(8,'Admin','Shivang abrol','shivang.a@westagilelabs.com','$2a$10$aSwIIURMTTHh8CEP9t.3TOiJBg1DaXX3yAD46UbOfAykiCrhWkbE.','male','1996-07-15',9018060697);
INSERT INTO "users" VALUES(10,'User','Nishanth pappula','nishanthpappula333@gmail.com','$2a$10$DsHR58DAr1xMN5J1v.nAWuGj1K2FZA3o5SFmT37VMruXASl0dlpWS','male','2018-03-08',8712770689);
INSERT INTO "users" VALUES(11,'User','Veena','veenadevi@gmail.com','$2a$10$vmVSeeh9efs3R4TbGVI6WO1GHuEIHGCI/qjApvprb9rSItmV/IeZO','female','2018-03-08',9419181257);
INSERT INTO "users" VALUES(12,'User','Aishwarya yerrama','aishwarya.y@westagilelabs.com','$2a$10$ZYT0Q19P9zZCqU8aUFHZJO.6LdQo4C3XewjAjYqkjDaYOJM.XI/Qi','female','2018-03-12',9874561258);
INSERT INTO "users" VALUES(13,'User','Rahul','rahulabrol19@gmail.com','$2a$10$ChOSsgv2duwQQFSCC/Itseot03n9Futj5KTtVZvs27qBW0qjPeuDi','male','2018-03-12',9419181257);
INSERT INTO "users" VALUES(14,'User','Priyesh','priyesh@gmail.com','$2a$10$nSnIfEQ1FXqmhK9f3MODnuJpRMvTAK/Y8PJ0Z8JQZHqvtzWFJH.5.','male','2018-03-12',9018060697);
INSERT INTO "users" VALUES(15,'User','Revan','revan@gmail.com','$2a$10$hP70hi5wfkj08Apji1VjcOWRwkLpVcHKaVfjEdKgVocbmTC5rvecq','male','2018-03-12',9419612574);
INSERT INTO "users" VALUES(16,'User','Shiva','shiva@gmail.com','$2a$10$KbibgkEh3.u/DAEVeByQSO2GYpkmcuqbDmXGhzsQ/e9ND/0N8f8vS','male','2018-03-14',8712770689);
CREATE TABLE "competitions" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "caption" varchar, "tagline" varchar, "button_name" varchar, "ending_date" date, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "competition_type" varchar);
INSERT INTO "competitions" VALUES(6,'Divaz','annual event of Midas touch','I have what it takes to be a diva','2018-03-15','model.png','2018-03-12 11:34:15.593837','2018-03-12 11:34:15.593837','images');
INSERT INTO "competitions" VALUES(7,'Pop Rock','Hosted by Vienna','ENTER NOW','2018-03-15','pop.jpg','2018-03-12 11:36:26.689820','2018-03-12 11:36:26.689820','video');
INSERT INTO "competitions" VALUES(9,'Hello Arena','hosted by arean','ENTER NOW','2018-03-17','new_year_lights_street_holiday_italy_winter_valgardena_hotel_resort_italia_christmas_____d_3008x2000.jpg','2018-03-14 09:30:26.181976','2018-03-14 09:30:26.181976','images');
INSERT INTO "competitions" VALUES(10,'New Videoz','Hosted by Vienna','Enter','2018-03-20','4105596-ruby-wallpapers.png','2018-03-14 13:02:37.256143','2018-03-14 13:02:37.256143','video');
CREATE TABLE "votes" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "voted_by_id" integer, "voted_for_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "competition_id" integer, "voteable_id" integer, "voteable_type" varchar);
INSERT INTO "votes" VALUES(86,11,NULL,'2018-03-15 08:57:03.569899','2018-03-15 08:57:03.569899',6,6,'Upload');
INSERT INTO "votes" VALUES(87,11,NULL,'2018-03-15 08:57:11.031143','2018-03-15 08:57:11.031143',6,6,'Upload');
INSERT INTO "votes" VALUES(88,10,NULL,'2018-03-15 08:58:58.549427','2018-03-15 08:58:58.549427',6,7,'Upload');
INSERT INTO "votes" VALUES(89,10,NULL,'2018-03-15 08:59:21.570517','2018-03-15 08:59:21.570517',6,7,'Upload');
INSERT INTO "votes" VALUES(90,16,NULL,'2018-03-15 09:02:16.230983','2018-03-15 09:02:16.230983',6,6,'Upload');
INSERT INTO "votes" VALUES(91,16,NULL,'2018-03-15 09:02:19.468984','2018-03-15 09:02:19.468984',6,6,'Upload');
INSERT INTO "votes" VALUES(92,16,NULL,'2018-03-15 09:29:34.931332','2018-03-15 09:29:34.931332',7,3,'Video');
INSERT INTO "votes" VALUES(93,10,NULL,'2018-03-15 10:44:59.558506','2018-03-15 10:44:59.558506',7,4,'Video');
INSERT INTO "votes" VALUES(94,10,NULL,'2018-03-15 10:45:08.632760','2018-03-15 10:45:08.632760',7,4,'Video');
CREATE TABLE "uploads" ("id" integer NOT NULL PRIMARY KEY, "name" varchar DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "uploaded_by_id" integer DEFAULT NULL, "competition_id" integer);
INSERT INTO "uploads" VALUES(2,'54df26048323f74b219da0dca522e1cb-700.jpg','2018-03-12 12:04:52.143436','2018-03-12 12:04:52.143436',11,NULL);
INSERT INTO "uploads" VALUES(6,'new_year_lights_street_holiday_italy_winter_valgardena_hotel_resort_italia_christmas_____d_3008x2000.jpg','2018-03-13 10:15:15.932451','2018-03-13 10:15:15.932451',10,6);
INSERT INTO "uploads" VALUES(7,'Pine__branch__needles__drops__rain__green_4000x2658.jpg','2018-03-14 03:53:27.865887','2018-03-14 03:53:27.865887',16,6);
INSERT INTO "uploads" VALUES(8,'4105596-ruby-wallpapers.png','2018-03-14 09:32:36.260747','2018-03-14 09:32:36.260747',10,9);
CREATE TABLE "videos" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "video" varchar, "video_uploaded_by_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "competition_id" integer);
INSERT INTO "videos" VALUES(1,'The.Pursuit.Of.Happyness.2006.1080p.BrRip.x264.YIFY.mp4',11,'2018-03-11 12:20:23.542428','2018-03-11 12:20:23.542428',NULL);
INSERT INTO "videos" VALUES(2,'Padman_2018_Hindi_720p_PreDvDRip_x264_AAC_-_xRG.mkv',10,'2018-03-13 06:27:59.589937','2018-03-13 06:27:59.589937',NULL);
INSERT INTO "videos" VALUES(3,'Padman_2018_Hindi_720p_PreDvDRip_x264_AAC_-_xRG.mkv',10,'2018-03-14 11:17:27.109171','2018-03-14 11:17:27.109171',7);
INSERT INTO "videos" VALUES(4,'The.Pursuit.Of.Happyness.2006.1080p.BrRip.x264.YIFY.mp4',11,'2018-03-14 12:52:03.537239','2018-03-14 12:52:03.537239',7);
INSERT INTO "videos" VALUES(5,'Padman_2018_Hindi_720p_PreDvDRip_x264_AAC_-_xRG.mkv',10,'2018-03-14 13:04:55.027789','2018-03-14 13:04:55.027789',10);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('competitions',10);
INSERT INTO "sqlite_sequence" VALUES('videos',5);
INSERT INTO "sqlite_sequence" VALUES('votes',94);
COMMIT;