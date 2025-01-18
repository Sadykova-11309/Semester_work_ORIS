CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_admin int NOT NUll,
);

CREATE TABLE Series (
    series_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    logo_url VARCHAR(255) NOT NULL,
    poster_url VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    description NTEXT,
    rating INT NOT NULL,
    genre NVARCHAR(255) NOT NULL,
    country NVARCHAR(255) NOT NULL,
    plot NVARCHAR(255)NOT NULL
);


CREATE TABLE Episodes (
    episode_id INT IDENTITY(1,1) PRIMARY KEY,
    series_id INT NOT NULL,
    episode_number INT NOT NULL,
    logo_url VARCHAR(255),
    FOREIGN KEY (series_id) REFERENCES Series(series_id) ON DELETE CASCADE
);

CREATE TABLE People (
    person_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    role NVARCHAR(50) NOT NULL,
    photo_url VARCHAR(255)
);

CREATE TABLE Series_People (
    series_id INT NOT NULL,
    person_id INT NOT NULL,
    PRIMARY KEY (series_id, person_id),
    FOREIGN KEY (series_id) REFERENCES Series(series_id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES People(person_id) ON DELETE CASCADE
);


INSERT INTO Series (title, logo_url, poster_url, year, description, rating, genre, country, plot)
VALUES
(N'Пекарь и Красавица', 'https://pic.uma.media/cwebp/pic/cardimage/35/ef/35efb09e49cc2b441b47bb2f5631ab49.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/54/06/5406430e13c828d4246b96140ec4d1f0.jpg?size=1488&quality=90', 2020, N'Даниэль Гарсия работает в семейной пекарне и уже много лет несчастлив в отношениях. Ноа Гамильтон — успешная супермодель, бросившая голливудского красавчика. Однажды их дороги пересекаются, и между молодыми людьми пробегает искра. Ноа зовет Даниэля прокатиться на машине, после чего вечер плавно перетекает в череду удивительных событий. И чем больше Даниэль погружается в светскую жизнь новой знакомой, тем лучше осознает, что Ноа — девушка его мечты.', 18, N'Мелодрама',N'Израиль',N'Любовь'),
(N'Портрет Убийцы', 'https://pic.uma.media/cwebp/pic/cardimage/0c/b3/0cb38da6972340bae703a66f4a8d7205.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/d9/98/d998ca6d09273baaf80f97843c5a4ec6.jpg?size=1488&quality=90', 2021, N'Ева узнает правду о пропавшем сыне. Теперь у нее есть возможность наладить отношения со своим ребенком. В это время коллеги Евы сталкиваются с новой проблемой: команда вынуждена идти против высшего руководства, чтобы найти напавшего на Мариз. Бернар готов отомстить за начальницу, вот только чем это обернется для остальных?', 18, N'Детектив',N'Канада',N'Маньяки'),
(N'Черная Жемчужина', 'https://pic.uma.media/cwebp/pic/cardimage/3b/5c/3b5c5e67d798f86e10a66f9e9df6788c.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/61/4e/614e8ec92a8c955cb04c8d85ff829936.jpg?size=1488&quality=90', 2022, N'Хазал и Кенан молоды, влюблены и мечтают пожениться. Все меняется, когда в город приезжает влиятельный бизнесмен Вурал. Он сразу влюбляется в красавицу Хазал и вынуждает девушку выйти за него замуж. Вот только романтик Кенан не готов останавливаться и предавать свою любовь. Сможет ли он вернуть Хазал?', 18, N'Драма',N'Турция',N'Любовь'),
(N'Праздники 2', 'https://pic.uma.media/cwebp/pic/cardimage/8b/fb/8bfba3e276a6c9465c077b5c9a6647d2.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/23/4e/234e3e51de05409f6597f1d3787309da.jpg?size=1090&quality=90', 2023, N'Во 2 сезоне Пыжовы по-прежнему справляют праздники вместе, но уже в новых для себя ролях. Сестры собираются выйти замуж в один день, что порождает новые конфликты. Паша не может смириться с тем, что Лена пытается переделать его под свои идеалы. Вовик надеется, что отцовство поднимет его в глазах родителей Юли, вот только ребенок добавляет еще больше проблем в их отношения. Мама продолжает все контролировать, а глава семейства пытается привыкнуть к статусу пенсионера-дедушки. Тем временем на горизонте появляется новый родственник.', 18, N'Комедия',N'Россия',N'Семья'),
(N'Гудбай', 'https://pic.uma.media/cwebp/pic/cardimage/92/ff/92ff3a30123bfd636bdd0b7a675fac6e.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/e6/e4/e6e42a98c56b9773755b473d6a99482a.jpg?size=1090&quality=90', 2024, N'Американский президент Джо Байден хочет самостоятельно разобраться, почему санкции неэффективны против русских. Инкогнито он летит в Россию, и в первый же день теряет документы. Теперь Байден вынужден жить в хрущевке и подрабатывать учителем английского языка, чтобы накопить на обратный билет.', 16, N'Комедия',N'Россия',N'Политика'),
(N'Смешарики', 'https://pic.uma.media/cwebp/pic/cardimage/c0/99/c0992a350a1e1c1f93d7761819a31009.jpg?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/fd/ee/fdee4981ef4068abf4d1721d362a70a8.jpg?size=1090&quality=90', 2004, N'В солнечной Ромашковой долине, где живут смешарики, каждый день происходит что-то интересное, а герои попадают в необычные и иногда даже опасные ситуации. Но с помощью друзей смешарики всегда справляются с любыми проблемами.', 0, N'Мультфильм',N'Россия',N'Дети'),
(N'Котенок по имени Гав', 'https://pic.uma.media/cwebp/pic/cardimage/4a/bf/4abf02833c69d7f27b79aa62d91ccd63.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/4a/04/4a04ab2fb757f69b3c7f79c271c8773d.jpg?size=1090&quality=90', 1976, N'Котенку трудно понять, как все вокруг устроено, ведь он еще совсем маленький. Несмотря на трудности, герой не унывает и учит других состраданию, поэтому быстро находит друзей. Вместе с щенком Шариком они попадают в нелепые ситуации, выбраться из которых им помогает находчивость и доброта. Какие сюрпризы приготовил им большой и непонятный мир?', 0, N'Мультфильм',N'СССР',N'Дети'),
(N'Батя', 'https://pic.uma.media/cwebp/pic/cardimage/b0/f2/b0f2f873040480e30284e02fc0f89653.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/27/11/2711b7c5a5afd248586c0c400f0d8925.jpg?size=1536&quality=90', 2021, N'Мини-сериал по мотивам нашумевшего фильма «Батя», который покажет еще больше скетчей об отношениях отца и сына и том, каким было детство в эпоху тяжелых девяностых. Максу 35 лет, он много работает и практически не видит семью, а проблемы с детьми улаживает, покупая им новую игрушку или подсовывая планшет. Макс вместе с семьей отправляется в автопутешествие, чтобы поздравить отца с юбилеем, в ходе поездки спорит с женой о методах воспитания и вспоминает свое детство: ружье из палки, уроки арифметики и многочисленные застолья. Макс задает себе вопрос, а хороший ли он отец?', 16, N'Комедия',N'Россия',N'Семья'),
(N'Синий Трактор', 'https://pic.uma.media/cwebp/pic/cardimage/e0/13/e01304214753bdc10b88a7a78d42240a.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/9f/7c/9f7c93b0776362a0146d8972d1b1ff45.jpg?size=1536&quality=90', 2014, N'Музыкальный мультсериал о веселом Синем тракторе, который помогает малышам разобраться в предметах и цветах, учит различать «право» и «лево», сравнивать размеры и расстояния и многое другое.', 0, N'Мультфильм',N'Россия',N'Дети'),
(N'Хороший человек', 'https://pic.uma.media/cwebp/pic/cardimage/23/5c/235cd535695c8ba7a819690f27ee61d1.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/c4/52/c452fd22b083872836c7f91ef3fbe2e6.jpg?size=1488&quality=90', 2020, N'Блогер из Вознесенска поднимает шумиху вокруг предположения, что в городе уже много лет действует серийный убийца. Московское начальство не слишком этому верит, но отправляет следовательницу Евгению проверить запрос. Местные не особо жалуют приехавшую. Разбирая обстоятельства дела, главная героиня приходит к выводу, что маньяк действительно существует. Тот возомнил себя чистильщиком, а потому похищает «порочных» девушек и убивает их у себя в логове. Параллельно Жене удается узнать о криминальном прошлом Вознесенска с убийствами банд и переделами собственности. Для Евгении попытки отыскать душегуба отчасти личная история. Отец-тиран учил ее, что девочки всегда слабее мальчиков. И схожее пренебрежительное отношение к женщинам она видит в поведении убийцы. А тот, в свою очередь, все ближе подбирается к московской гостье.', 18, N'Детектив',N'Россия',N'Маньяки'),
(N'Нефть', 'https://pic.uma.media/cwebp/pic/cardimage/5a/7c/5a7c16311788b44e439f784fb25cad01.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/a9/dd/a9dd5b06c6bf96b0917bcec04cc05a10.jpg?size=1488&quality=90', 2024, N'С XX века нефть является одним из самых ценных ресурсов для всего человечества. Для России черное золото стало особенно важным ресурсом, который позволил стране окрепнуть и развиваться.', 16, N'Документальный',N'Россия',N'Документальный'),
(N'Вика Ураган', 'https://pic.uma.media/cwebp/pic/cardimage/a8/67/a867a87cfd85fd2fc7eec5e4fd17bee4.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/b3/47/b347de6c1d1c96aff41cd514fa8964bc.jpg?size=1488&quality=90', 2023, N'Вика отбыла срок в женской колонии за то, что случайно выбила глаз хулигану, а, вернувшись, обнаружила, что ее поступок оставил след на всей семье. Мама превратила ее квартиру в магазин товаров для взрослых, у мужа роман с другой женщиной, а маленький сын Гриша с особенностями развития находится в интернате. Новый мир Вики — это пошарпанная квартира с одинокой старушкой, подругой из колонии и особенным ребенком. Вике придется добиваться справедливости, балансируя между желанием сносить все на своем пути и решать проблемы с помощью кулаков, и верой в то, что добро победит.', 16, N'Комедия',N'Россия',N'Семья'),
(N'Как вырастить маньяка?', 'https://pic.uma.media/cwebp/pic/cardimage/44/8c/448c1778ee786f6f345ea2a6f5d53b7d.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/9a/c6/9ac60643c689107d602e8eb75be08cf7.jpg?size=1488&quality=90', 2024, N'В трех сериях матери самых известных маньяков рассказывают о своих сыновьях: об их рождении и взрослении. Как появился на свет Битцевский маньяк, был ли Пензенский людоед вегетарианцем и как мать Копейского душителя уже 20 лет пытается оправдать сына?', 18, N'Документальный',N'Россия',N'Маньяки'),
(N'Плевако', 'https://pic.uma.media/cwebp/pic/cardimage/81/d6/81d6f72af32ab9db2ca837c330764d96.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/91/ba/91ba7e867b63e0c4b5029adf43d95852.jpg?size=1488&quality=90', 2021, N'Сериал, вдохновленный реальной историей жизни известного российского адвоката. Выдающийся ораторский талант и природная смекалка помогают ему в пух и прах разносить обвинителей в суде, а простые люди считают его героем. Но однажды мир Николая Федоровича начинает рушиться: в его конторе проводятся обыски, королева воровского мира хочет ему отомстить, а внезапно вспыхнувшие взаимные чувства к чужой жене рискуют обернуться катастрофой. Перед Плевако встает вопрос: как помогать людям и сохранить любовь, если под угрозой твоя жизнь, карьера и репутация?', 16, N'Детектив',N'Россия',N'Политика'),
(N'Жвачка', 'https://pic.uma.media/cwebp/pic/cardimage/6d/66/6d667b2fedf2f5b5e26ff8a18339c678.png?size=346&quality=90', 'https://pic.uma.media/cwebp/pic/cardimage/10/33/103376f3feecdf6573e506f065e569e2.jpg?size=1488&quality=90', 2024, N'Галя считает дни до того момента, как сможет покинуть стены детдома и поступить на сценарный факультет ВГИКа. В интернете она знакомится с самоуверенным и обеспеченным парнем Ромой, который не воспринимает Галю всерьез, но девушка прилипает к нему как жвачка. Рома готов на все, чтобы избавиться от навязчивого преследования, и придумывает историю своего убийства. Эта легкомысленная ложь превращает в кошмар жизнь Гали, твердо решившей отыскать убийцу...', 16, N'Драма',N'Россия',N'Любовь');



INSERT INTO Series_People(series_id, person_id)
VALUES 
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(4, 7),
(4, 8),
(4, 9),
(5, 13),
(5, 20),
(5, 15),
(6, 20),
(6, 10),
(6, 9),
(7, 19),
(7, 10),
(7, 21),
(8, 13),
(8, 17),
(8, 21),
(9, 10),
(9, 11),
(9, 12),
(10, 7),
(10, 8),
(10, 9),
(11, 9),
(11, 18),
(11, 3),
(12, 17),
(12, 18),
(12, 19),
(13, 21),
(13, 12),
(13, 15),
(14, 19),
(14, 20),
(14, 21),
(15, 11),
(15, 16),
(15, 14);





INSERT INTO Episodes (series_id, episode_number, logo_url)
VALUES 
(1, 1, 'https://pic.uma.media/cwebp/pic/video/2f/15/2f15f6f0cbdebdf8dca33c2176622e74.jpg?size=410&quality=95'),
(1, 2, 'https://pic.uma.media/cwebp/pic/video/50/c0/50c09f57d17ff09ccee5c9610cb4f167.jpg?size=410&quality=95'),
(1, 3, 'https://pic.uma.media/cwebp/pic/video/2d/15/2d15504aa269456751aa789c5e0e9656.jpg?size=410&quality=95'),
(1, 4, 'https://pic.uma.media/cwebp/pic/video/82/c4/82c4a204b0c8b6c106eff4c6b84fa93b.jpg?size=410&quality=95'),
(2, 1, 'https://pic.uma.media/cwebp/pic/video/b8/07/b80778ed3c4ea085e66b4c5cde7d85c6.jpg?size=410&quality=95'),
(2, 2, 'https://pic.uma.media/cwebp/pic/video/2b/73/2b73636da69e081cb363e90cd16715b7.jpg?size=410&quality=95'),
(2, 3, 'https://pic.uma.media/cwebp/pic/video/43/cf/43cf35a52dd30e1a07bfff2cf302cf2e.jpg?size=410&quality=95'),
(2, 4, 'https://pic.uma.media/cwebp/pic/video/a5/fa/a5fa6baaa71e316f1ffd97bda8192c96.jpg?size=410&quality=95'),
(3, 1, 'https://pic.uma.media/cwebp/pic/video/0e/e4/0ee49a5b74f3b3b39060bd15eae06a54.jpg?size=410&quality=95'),
(3, 2, 'https://pic.uma.media/cwebp/pic/video/d1/a3/d1a32c810906876d3f86f09619a1b971.jpg?size=410&quality=95'),
(3, 3, 'https://pic.uma.media/cwebp/pic/video/18/22/1822cccda5ac2e22158dd26611f2aaaa.jpg?size=410&quality=95'),
(3, 4, 'https://pic.uma.media/cwebp/pic/video/6d/9a/6d9a4cb04a5a21080643b332bb22f04d.jpg?size=410&quality=95'),
(4, 1, 'https://pic.uma.media/cwebp/pic/video/bc/77/bc7793f4582b5d22bd1c59a461434b20.jpg?size=410&quality=95'),
(4, 2, 'https://pic.uma.media/cwebp/pic/video/25/9f/259fabd645dbc31d91e39ef9722b99aa.jpg?size=410&quality=95'),
(4, 3, 'https://pic.uma.media/cwebp/pic/video/a7/f3/a7f3e26d0c8911750918fd9d8e69bbe3.jpg?size=410&quality=95'),
(4, 4, 'https://pic.uma.media/cwebp/pic/video/1b/6b/1b6b75015facec4a14eee1bb2aac0e78.jpg?size=410&quality=95'),
(5, 1, 'https://pic.uma.media/cwebp/pic/video/ac/31/ac3175529986793e660850d58b8e68ca.jpg?size=410&quality=95'),
(5, 2, 'https://pic.uma.media/cwebp/pic/video/d6/fe/d6feec8f7d6f4f2c36b9ecdeab528bb1.jpg?size=410&quality=95'),
(5, 3, 'https://pic.uma.media/cwebp/pic/video/20/28/20282f1760fbbfb6b222909b01b08396.jpg?size=410&quality=95'),
(5, 4, 'https://pic.uma.media/cwebp/pic/video/09/c6/09c6828d2a2ea9f2b92ce274e19e115e.jpg?size=410&quality=95'),
(6, 1, 'https://pic.uma.media/cwebp/pic/video/13/2a/132a2cb9ffda5a53d1dfe37962fe3180.jpg?size=410&quality=95'),
(6, 2, 'https://pic.uma.media/cwebp/pic/video/56/92/569236cf22bd970acd5ae239791a58f6.jpg?size=410&quality=95'),
(6, 3, 'https://pic.uma.media/cwebp/pic/video/87/f0/87f0220c856ab7285e064e1329b7ccc4.jpg?size=410&quality=95'),
(6, 4, 'https://pic.uma.media/cwebp/pic/video/17/07/1707f440bdeca3566c1bacd93b27bc60.jpg?size=410&quality=95'),
(7, 1, 'https://pic.uma.media/cwebp/pic/video/22/2b/222bc70bf7393e23162426c06128037e.jpg?size=410&quality=95'),
(7, 2, 'https://pic.uma.media/cwebp/pic/video/e2/0e/e20e3b35215e5e24cb398c1ba0714768.jpg?size=410&quality=95'),
(7, 3, 'https://pic.uma.media/cwebp/pic/video/a7/be/a7be6d28afdce8ce8d14ff3343dcad52.jpg?size=410&quality=95'),
(7, 4, 'https://pic.uma.media/cwebp/pic/video/fc/6e/fc6e79e811671549c9ff7a6649e92b44.jpg?size=410&quality=95'),
(8, 1, 'https://pic.uma.media/cwebp/pic/video/cc/58/cc58bdce3e383c9341a1d9fc7b4b78e2.jpg?size=410&quality=95'),
(8, 2, 'https://pic.uma.media/cwebp/pic/video/3c/76/3c76e460796fe73d01a58c4f1096736e.jpg?size=410&quality=95'),
(8, 3, 'https://pic.uma.media/cwebp/pic/video/16/d8/16d88f32869e3c2fd598b7e8e6fe4a79.jpg?size=410&quality=95'),
(8, 4, 'https://pic.uma.media/cwebp/pic/video/99/25/99255b49d7831117db4dd9be2ade65d7.jpg?size=410&quality=95'),
(9, 1, 'https://pic.uma.media/cwebp/pic/video/8f/00/8f004794f7fe21b5e6d0498e1d9e35bb.jpg?size=410&quality=95'),
(9, 2, 'https://pic.uma.media/cwebp/pic/video/70/27/70272d451bb19c1ae1a670499aa2189a.jpg?size=410&quality=95'),
(9, 3, 'https://pic.uma.media/cwebp/pic/video/84/23/8423de866ecf139e8cf472480fa9ba68.jpg?size=410&quality=95'),
(9, 4, 'https://pic.uma.media/cwebp/pic/video/90/ae/90ae81b399b7156329d2e51303b67bfe.jpg?size=410&quality=95'),
(10, 1, 'https://pic.uma.media/cwebp/pic/video/42/79/42795e7463885921ceececd73caa55c1.jpg?size=410&quality=95'),
(10, 2, 'https://pic.uma.media/cwebp/pic/video/82/97/82977493e5e4a19519e1a32215226d92.jpg?size=410&quality=95'),
(10, 3, 'https://pic.uma.media/cwebp/pic/video/b2/39/b239f75d004e1977c0a68a1585633531.jpg?size=410&quality=95'),
(10, 4, 'https://pic.uma.media/cwebp/pic/video/85/f2/85f20ee065845aedc0406003c5a462d4.jpg?size=410&quality=95'),
(11, 1, 'https://pic.uma.media/cwebp/pic/video/27/82/2782c12c92eb3110c61945db0a2765d6.jpg?size=410&quality=95'),
(11, 2, 'https://pic.uma.media/cwebp/pic/video/a5/0a/a50a5eddf6917d1e081a1a44cf5e3c12.jpg?size=410&quality=95'),
(11, 3, 'https://pic.uma.media/cwebp/pic/video/b3/f2/b3f2bea9959ff4683cab52887a2000ef.jpg?size=410&quality=95'),
(11, 4, 'https://pic.uma.media/cwebp/pic/video/6c/39/6c390fee37c76bccb404351141020611.jpg?size=410&quality=95'),
(12, 1, 'https://pic.uma.media/cwebp/pic/video/eb/ce/ebce46feb3812bde5f91d9f3a93fba30.jpg?size=410&quality=95'),
(12, 2, 'https://pic.uma.media/cwebp/pic/video/59/28/5928494ebec199b20deb277584704a05.jpg?size=410&quality=95'),
(12, 3, 'https://pic.uma.media/cwebp/pic/video/f2/3e/f23e9ee304e7b8876d27d96d9e34b5c9.jpg?size=410&quality=95'),
(12, 4, 'https://pic.uma.media/cwebp/pic/video/39/db/39dbca334bd7e279fc8c8f6b1d57386a.jpg?size=410&quality=95'),
(13, 1, 'https://pic.uma.media/cwebp/pic/video/9d/34/9d3464f64f4f1ea1cd30fb750da3098e.jpg?size=410&quality=95'),
(13, 2, 'https://pic.uma.media/cwebp/pic/video/c5/97/c5976771359211616d376fb01e13b84b.jpg?size=410&quality=95'),
(13, 3, 'https://pic.uma.media/cwebp/pic/video/67/75/677515febb103072c701fe3e55e9af1a.jpg?size=410&quality=95'),
(13, 4, 'https://pic.uma.media/cwebp/pic/video/14/98/149857aab90b56f2539fb03055e7f5e0.jpg?size=410&quality=95'),
(14, 1, 'https://pic.uma.media/cwebp/pic/video/ef/8f/ef8f3eb5de2d88af7854a7294082932f.jpg?size=410&quality=95'),
(14, 2, 'https://pic.uma.media/cwebp/pic/video/7c/3f/7c3fa71b05ed6cbcf2f2bab54b23bb1a.jpg?size=410&quality=95'),
(14, 3, 'https://pic.uma.media/cwebp/pic/video/6e/d0/6ed02ff5da2998530e5a7e3911435bce.jpg?size=410&quality=95'),
(14, 4, 'https://pic.uma.media/cwebp/pic/video/3b/ea/3beafe1d8ec5fac1bb1a4253d7b18fd0.jpg?size=410&quality=95'),
(15, 1, 'https://pic.uma.media/cwebp/pic/video/73/bd/73bd77695c11727d2da4305306bcf56a.jpg?size=410&quality=95'),
(15, 2, 'https://pic.uma.media/cwebp/pic/video/3f/a6/3fa684b0d32861bc13d4e33da64fdc67.jpg?size=410&quality=95'),
(15, 3, 'https://pic.uma.media/cwebp/pic/video/6f/af/6fafb37dc7b0690f4518c3da1d03863b.jpg?size=410&quality=95'),
(15, 4, 'https://pic.uma.media/cwebp/pic/video/11/4e/114e35f1da511fa902478f2c79ff0fed.jpg?size=410&quality=95');



INSERT INTO People (first_name, last_name, role, photo_url)
VALUES 
(N'Виктор', N'Расук', N'актёр', 'https://pic.uma.media/cwebp/pic/person/4f/bd/4fbdbe7376d80f7f12af00e8aeac6417.jpg?size=125&quality=95'),
(N'Натали', N'Келли', N'актриса', 'https://pic.uma.media/cwebp/pic/person/89/20/8920d30d94188e730cc123c16ef40387.jpg?size=125&quality=95'),
(N'Стив', N'Парлман', N'режиссер', 'https://pic.uma.media/cwebp/pic/person/ba/9d/ba9def63b184b515eacf6686a20a4937.jpg?size=125&quality=95'),
(N'Эмиль', N'Шнайдер', N'актёр', 'https://pic.uma.media/cwebp/pic/person/f5/86/f586e180e50d62ed8b40b35936c4f284.jpg?size=125&quality=95'),
(N'Рейчел', N'Гратон', N'актриса', 'https://pic.uma.media/cwebp/pic/person/73/e1/73e10fafd6dfdf5bfe920aef4a50e087.jpg?size=125&quality=95'),
(N'Джио', N'Леоне', N'режиссер', 'https://pic.uma.media/cwebp/pic/person/21/51/2151b58fd111f18a56c66e48be9e131a.jpg?size=125&quality=95'),
(N'Виталий', N'Хаев', N'актёр', 'https://pic.uma.media/cwebp/pic/person/fe/4e/fe4e2bd15a80ad80413a5a7d2d418e99.jpg?size=125&quality=95'),
(N'Анастасия', N'Калашникова', N'актриса', 'https://pic.uma.media/cwebp/pic/person/a2/79/a2790c250a907ba5fd4631823729fe29.jpg?size=125&quality=95'),
(N'Борис', N'Дергачев', N'режиссер', 'https://pic.uma.media/cwebp/pic/person/66/f9/66f968882311c9a75bde4205438b47e3.jpg?size=125&quality=95'),
(N'Станислав', N'Старовойтов', N'актёр', 'https://pic.uma.media/cwebp/pic/person/f2/a7/f2a7b97ed3fea7d2b356b7d96c4f380a.jpg?size=125&quality=95'),
(N'Надежда', N'Михалкова', N'актриса', 'https://pic.uma.media/cwebp/pic/person/ca/5e/ca5e1cbb14c1111b4a6aee6829668c80.jpg?size=125&quality=95'),
(N'Дмитрий', N'Ефимович', N'режиссёр', 'https://pic.uma.media/cwebp/pic/person/eb/94/eb94a545d8cddb4be3f4d50a543957ac.jpg?size=125&quality=95'),
(N'Никита', N'Ефремов', N'актёр', 'https://pic.uma.media/cwebp/pic/person/f5/77/f5777ae536dbb902a0a3b12de3e720cc.jpg?size=125&quality=95'),
(N'Юлия', N'Снегирь', N'актриса', 'https://pic.uma.media/cwebp/pic/person/41/36/413600d32d4d6230a8457dd338eb4ee3.jpg?size=125&quality=95'),
(N'Семен', N'Каевский', N'режиссёр', 'https://pic.uma.media/cwebp/pic/person/8e/2b/8e2bade8919c01af62d0d515aa6a7d3a.jpg?size=125&quality=95'),
(N'Иван', N'Добронравов', N'актёр', 'https://pic.uma.media/cwebp/pic/person/e2/e3/e2e33004027fbac465ff84e3acd09e4f.jpg?size=125&quality=95'),
(N'Аглая', N'Тарасова', N'актриса', 'https://pic.uma.media/cwebp/pic/person/b3/a3/b3a344efee2a2f8a0b414062730a2684.jpg?size=125&quality=95'),
(N'Николай', N'Фоменко', N'режиссёр', 'https://pic.uma.media/cwebp/pic/person/f7/21/f721cc6858200cde05b10b92d3455f2d.jpg?size=125&quality=95'),
(N'Сергей', N'Безруков', N'актёр', 'https://pic.uma.media/cwebp/pic/person/ae/3b/ae3b19ee7e7a0a8fe0b59d58cd6dbd92.jpg?size=125&quality=95'),
(N'Елена', N'Семенова', N'актриса', 'https://pic.uma.media/cwebp/pic/person/7c/1a/7c1afcba8bbe7434a880e11d95d5713b.jpg?size=125&quality=95'),
(N'Анна', N'Маттисон', N'режиссёр', 'https://pic.uma.media/cwebp/pic/person/cf/39/cf3914d069d48c9e8af5559d3e429741.jpg?size=125&quality=95');

INSERT INTO Users (email, password, is_admin)
VALUES
(user@mail.com, 12345, 0)
(admin@mail.com, password, 1)