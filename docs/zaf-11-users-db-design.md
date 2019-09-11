# af-01-users-db-design.md

`Jum'at, 19 Juli 2019`

**`23:28`**

## Users Diagram

Entitas utama data adalah `users` atau `pengguna` aplikasi. Entitas lain yang terkait erat dengan identitas adalah `user_roles`, `user_avatars`, `user-religions` dan `user-duties`

0. Code Pembentuk Diagram

    `users`

    ```sql
    Table users {
        id int(11) [pk, NOT NULL]
        name varchar(100)
        account varchar(255)
        password varchar(255)
        role int(11)
        ric varchar(20)
        birth_place varchar(45)
        birth_date date
        gender tinyint(4)
        faith tinyint(4)
    }

    Table user_roles {
        id int(11) [pk, NOT NULL]
        native varchar(100)
        name varchar(100)
    }

    Table user_avatars {
        id int(11) [pk, NOT NULL]
        user int(11)
        photo varchar(255)
        actived tinyint(4)
    }

    Table user_religions {
        id tinyint(4) [pk, NOT NULL]
        native varchar[45]
        name varchar(45)
    }

    Table user_gender {
        id tinyint(4) [pk, NOT NULL]
        native varchar(10)
        name varchar(10)
    }

    Ref: users.role > user_roles.id
    Ref: users.id < user_avatars.user
    Ref: users.faith > user_religions.id
    Ref: users.gender > user_gender.id
    ```

1. Diagram

    <p align="center">
        <img src="./figures/af-01-a-users.png" width="100%" />
        <br />Figure: af-01-a-users.png
    </p>

2. Sqls

    `user_roles` Table

    ```sql
    CREATE DATABASE  IF NOT EXISTS `bpr`;
    USE `bpr`;
    
    DROP TABLE IF EXISTS `user_roles`;
    CREATE TABLE `user_roles` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `native` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
        `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
    ```

    `user_gender` Table

    ```sql
    CREATE DATABASE  IF NOT EXISTS `bpr`;
    USE `bpr`;

    DROP TABLE IF EXISTS `user_gender`;
    CREATE TABLE `user_gender` (
        `id` tinyint(4) NOT NULL,
        `native` varchar(10) DEFAULT NULL,
        `name` varchar(10) DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
    ```

    `user_religions` Table

    ```sql
    CREATE DATABASE  IF NOT EXISTS `bpr`;
    USE `bpr`;
    
    DROP TABLE IF EXISTS `user_religions`;
    CREATE TABLE `user_religions` (
        `id` tinyint(4) NOT NULL AUTO_INCREMENT,
        `native` varchar(45) DEFAULT NULL,
        `name` varchar(45) DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
    ```

    `users` Table

    ```sql
    CREATE DATABASE  IF NOT EXISTS `bpr`;
    USE `bpr`;

    DROP TABLE IF EXISTS `users`;
    CREATE TABLE `users` (
        `id` int(11) NOT NULL,
        `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
        `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
        `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
        `role` int(11) DEFAULT NULL,
        `ric` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
        `birth_place` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
        `birth_date` date DEFAULT NULL,
        `gender` tinyint(4) DEFAULT NULL,
        `faith` tinyint(4) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `fk_users_1` (`role`),
        KEY `fk_users_2_idx` (`faith`),
        KEY `fk_users_3_idx` (`gender`),
        CONSTRAINT `fk_users_2` FOREIGN KEY (`faith`) REFERENCES `user_religions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `fk_users_3` FOREIGN KEY (`gender`) REFERENCES `user_gender` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `fk_users_1` FOREIGN KEY (`role`) REFERENCES `user_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
    ```

    `user_avatars` Table

    ```sql
    CREATE DATABASE  IF NOT EXISTS `bpr`;
    USE `bpr`;

    DROP TABLE IF EXISTS `user_avatars`;
    CREATE TABLE `user_avatars` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `user` int(11) DEFAULT NULL,
        `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
        `actived` tinyint(4) DEFAULT '0',
        PRIMARY KEY (`id`),
        KEY `user` (`user`),
        CONSTRAINT `user_avatars_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
    ```

7. Dummies Data

    `users` Table

    ```sql
    USE `bpr`;

    LOCK TABLES `users` WRITE;
    INSERT INTO `users`
        VALUES 
            (
                1,
                'Joko Wandyatmono',
                'bf59af91aeb8306261c665d5c9b50941f5242c94245ce7d3bc92bebae7e3d5b1',
                'bf59af91aeb8306261c665d5c9b50941f5242c94245ce7d3bc92bebae7e3d5b1',
                1,
                '1234567890123456',
                'Solo',
                '1961-06-23',
                1,
                1
            ),
            (
                2,
                'Lani Husadawati',
                '41d2b587f0f0497acd9f17293d22f45f54bc5f0726a3f3d4edf426fe384c11dd',
                '41d2b587f0f0497acd9f17293d22f45f54bc5f0726a3f3d4edf426fe384c11dd',
                4,
                '1234567890123456',
                'Solo',
                '1986-08-17',
                0,
                2
            ),
            (
                3,
                'Wongso Hermanto',
                'c85ad879e6f75b0b4b51de83450e5530bfd3fab85cc67418d2251f134f0ef92c',
                'c85ad879e6f75b0b4b51de83450e5530bfd3fab85cc67418d2251f134f0ef92c',
                2,
                '1234567890123456',
                'Solo',
                '1970-10-15',
                1,
                3
            ),
            (
                4,
                'Yusnita Sri Sundari',
                'e28bc14ef7ee01d17147dd302d552645fa7f4df30b05349c8b4099494475cd10',
                'e28bc14ef7ee01d17147dd302d552645fa7f4df30b05349c8b4099494475cd10',
                3,
                '1234567890123456',
                'Sukoharjo',
                '1990-04-28',
                0,
                1
            ),
            (
                5,
                'Andi Pratiknyo',
                '180348f5b22db17be014d5c1cb8151c858267cb44819e5460a7ae2528b91680e',
                '180348f5b22db17be014d5c1cb8151c858267cb44819e5460a7ae2528b91680e',
                5,
                '1234567890123456',
                'Tangerang',
                '1970-07-25',
                1,
                2
            ),
            (
                6,
                'Atika Shubert',
                '7d8aa9ea7dfe7be0112d05cc946364aa9334f45ba30fbbe9e376a4bdb85a1964',
                '7d8aa9ea7dfe7be0112d05cc946364aa9334f45ba30fbbe9e376a4bdb85a1964',
                6,
                '1234567890123456',
                'Klaten',
                '1981-02-13',
                1,
                2
            ),
            (
                7,
                'Perkuat Akseina',
                'c5957d4541f993f63104a756d2a8aa3fa360582b9e4379f38a4297fe815a9c69',
                'c5957d4541f993f63104a756d2a8aa3fa360582b9e4379f38a4297fe815a9c69',
                5,
                '1234567890123456',
                'Malang',
                '1981-07-17',
                0,
                2
            ),
            (
                8,
                'Pracoyo Sejati Leno',
                '043a43fa0703d0af5d80d84db2bd455c4eb9836e0ad34cc70ea3f451f04d6b16',
                '043a43fa0703d0af5d80d84db2bd455c4eb9836e0ad34cc70ea3f451f04d6b16',
                7,
                '1234567890123456',
                'Solo',
                '1980-06-12',
                0,
                2
            ),
            (
                9,
                'Puji Kaesthi',
                '8c87f6ec99f742cf462a8c121dbdae4a48fb666cbb002094f6572cd6c1adb951',
                '8c87f6ec99f742cf462a8c121dbdae4a48fb666cbb002094f6572cd6c1adb951',
                8,
                '1234567890123456',
                'Solo',
                '1986-01-27',
                1,
                2
            ),
            (
                10,
                'Putri Rimba Manangsang',
                '997af0fb6c844069db0e17d37b90e4e44314c5a84c2187f35ca4e45f82e66d59',
                '997af0fb6c844069db0e17d37b90e4e44314c5a84c2187f35ca4e45f82e66d59',
                8,
                '1234567890123456',
                'Mataram',
                '1987-09-10',
                1,
                2
            ),
            (
                11,
                'Sopan Sumangkir',
                'b2865123894a3ed061c3546de26914a00a1595a88254a993e98a47d67e41879e',
                'b2865123894a3ed061c3546de26914a00a1595a88254a993e98a47d67e41879e',
                7,
                '1234567890123456',
                'Sibolga',
                '1979-08-17',
                0,
                2
            ),
            (
                12,
                'Urip Wanodyo Sejati',
                'c7691d57aae84ccae80f8209a90e9f97170ade0d93559399105eb0db9b21a906',
                'c7691d57aae84ccae80f8209a90e9f97170ade0d93559399105eb0db9b21a906',
                8,
                '1234567890123456',
                'Yogya',
                '1987-03-02',
                1,
                2
            ),
            (
                13,
                'Fredddy Paloh',
                '51eeed7251f3f56288ee554afaa1028b7fbc3daacc4a952be4ae8d18ddaf3320',
                '51eeed7251f3f56288ee554afaa1028b7fbc3daacc4a952be4ae8d18ddaf3320',
                7,
                '1234567890123456',
                'Bogor',
                '1970-10-16',
                1,
                2
            );
    UNLOCK TABLES;
    ```

    `user_avatars` Table

    ```sql
    USE `bpr`;

    INSERT INTO `user_avatars`
        VALUES 
            (1,1,'joko_wandyatmono.jpg',0),
            (2,2,'lani_husadawati.jpg',0),
            (3,3,'wongso_hermanto.jpg',0),
            (4,4,'yusnita_sri_sundari.jpg',0),
            (5,5,'andi_pratiknyo.jpg',0),
            (6,6,'atika_shubert.jpg',0),
            (7,7,'perkuat_akseina.jpg',0),
            (8,8,'pracoyo_sejati_leno.jpg',0),
            (9,9,'puji_kaesthi.jpg',0),
            (10,10,'putri_rimba_manangsang.jpg',0),
            (11,11,'sopan_sumangkir.jpg',0),
            (12,12,'urip_wanodyo_sejati.jpg',0),
            (13,13,'freddy_paloh.jpg',0);
    UNLOCK TABLES;
    ```

    `user_roles` Table

    ```sql
    USE `bpr`;

    LOCK TABLES `user_roles` WRITE;
    INSERT INTO `user_roles`
        VALUES
            (1,'Developer','Pengembang'),
            (2,'Application Administrator','Administrator Aplikasi'),
            (3,'Head of Investment Division','Kabag Investasi'),
            (4,'Head of Receivables Division','Kabag Piutang'),
            (5,'Section Chief of Marketing','Kasie Pemasaran'),
            (6,'Section Chief of Receivables','Kasie Piutang'),
            (7,'Marketing Officer','Petugas Pemasaran'),
            (8,'Receivable Collector','Kolektor Piutang');
    UNLOCK TABLES;
    ```

    `user_gender` Table

    ```sql
    USE `bpr`;

    LOCK TABLES `user_gender` WRITE;
    INSERT INTO `user_gender`
        VALUES 
            (0,'female','laki-laki'),
            (1,'male','perempuan');
    UNLOCK TABLES;
    ```

    `user_religions` Table

    ```sql
    USE `bpr`;

    LOCK TABLES `user_religions` WRITE;
    INSERT INTO `user_religions`
        VALUES
            (1,'Islam','Islam'),
            (2,'Roman Catholic','Katolik'),
            (3,'Christianity','Kristen'),
            (4,'Hinduism','Hindu'),
            (5,'Budism','Budha'),
            (6,'Believism','Kepercayaan');
    UNLOCK TABLES;
    ```

`Sabtu, 20 Juli 2019`

**`04:32`**