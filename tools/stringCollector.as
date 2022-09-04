package tools 
{
	/**
	 * ...
	 * @author ...
	 */
	public class stringCollector 
	{
		
		public function stringCollector() 
		{
			
		}
		public static function getBuildingUpgradeText (_type:String, _lvl:Number)
		{
			var res:Object = new Object()
			res.lable = ""
			res.value = 0
			if (_lvl == 1) { res.lable = "Смазать все шарниры."; res.value = 50; }
			if (_lvl == 2) { res.lable = "Поставить урны."; res.value = 100; }
			if (_lvl == 3) { res.lable = "Покрасить углы."; res.value = 250; }
			if (_lvl == 4) { res.lable = "Вмонтировать музыку."; res.value = 400; }
			if (_lvl == 5) { res.lable = "Оборудовать современными полупроводниками для снижения энергозатрат."; res.value = 700; }
			if (_lvl == 6) { res.lable = "Ваще круто пропатчить аттракцион."; res.value = 800; }
			return res
		}
		public static function getBotUpgrade (_lvl:Number)
		{
			var res:Object = new Object ()
			res.lable = ""
			res.value = 0
			if (_lvl == 0) { res.lable = "Выдать инструкцию по безопасности."; res.value = 50; }
			if (_lvl == 1) { res.lable = "Выдать инструкцию по корпоративному этикету."; res.value = 10; }
			if (_lvl == 2) { res.lable = "Выдать бэджики сотруднику."; res.value = 200; }
			if (_lvl == 3) { res.lable = "Выдать фирменные бейсболки сотруднику."; res.value = 350; }
			if (_lvl == 4) { res.lable = "Выдать фирменную униформу сотруднику."; res.value = 500; }
			if (_lvl == 5) { res.lable = "Отправить сотрудника на обучение в центр повышения квалификации."; res.value = 600; }
			if (_lvl == 6) { res.lable = "Отправить сотрудника на обучение."; res.value = 1000; }
			
			return res
		}
		
		
		
		public static var botFemaleNameArray:Array = ["Александра","Алиса","Анастасия","Анна","Божена","Валерия",
													  "Варвара","Василиса","Вероника","Галина","Гертруда","Дарья",
													  "Джейн","Диана","Дина","Дора","Ева","Евгения","Екатерина",
													  "Елена","Елизавета","Жанна","Зарина","Изабелла","Изольда",
													  "Инга","Инна","Ирина","Ирма","Кристина","Ксения","Лада","Лариса",
													  "Лейла","Лилия","Лолита","Любовь","Людмила","Мадина","Майя",
													  "Марианна","Марина","Мария","Марта","Милена","Моника","Мэри",
													  "Надежда","Наталья","Ника","Нина","Нонна","Оксана","Олеся",
													  "Ольга","Патриция","Раиса","Ребекка","Регина","Рената","Сабина",
													  "Сарра","Светлана","Софья","Стелла","Таисия","Тамара","Татьяна",
													  "Шарлотта","Элла","Эмилия","Эмма","Эрика","Юлия","Яна"
													  ];
		public static var botFemaleLastNameArray:Array = ["Абдуллаева","Антипенко","Артюхова","Баринова","Бжезинская",
														  "Богомолова","Борисенко","Бурмистрова","Веревочкина","Воронова",
														  "Гериниг","Грибова","Гросс","Грэй","Даниленко","Данилова","Дмитриева",
														  "Дэвидсон","Емельянова","Еремия","Замятина","Зейналова","Измайлова",
														  "Кармино","Карнаухова","Корнеева","Кузнецова","Лемехова","Лестафье",
														  "Максимова","Мамонтова","Михайлова","Морган","Никитина","Николаевская",
														  "Новикова","Ольшанская","Пантелеева","Парамонова","Перелли","Петрова",
														  "Пименова","Плотник","Поллак","Ришар","Рыбакова","Севостьянова","Сидорова",
														  "Смит","Стеценко","Стоянова","Стренева","Сухова","Феоктистова","Фок",
														  "Фокс","Фурсенко","Хейли","Шмидт","Юрлова"
														  ];
		public static function fill_NameArray (Name:String,sex:int) {
			if (sex == 1) {
				botFemaleNameArray.push(Name);
			} else {
				botMaleNameArray.push(Name);
			}
			
		}
		public static function fill_LastNameArray (Name:String,sex:int) {
			if (sex == 1) {
				botFemaleLastNameArray.push(Name);
			} else {
				botMaleLastNameArray.push(Name);
			}
			
		}
		public static var botMaleNameArray:Array = ["Адам","Адольф","Алан","Александр","Алексей","Альберт","Андрей",
													"Артур","Борис","Вадим","Валерий","Виталий","Владимир","Геннадий",
													"Генрих","Георгий","Герман","Глеб","Григорий","Густав","Данила",
													"Джон","Джулиан","Дмитрий","Дэвид","Егор","Евгений","Жак","Жан",
													"Жорж","Илья","Игорь","Илья","Казимир","Карл","Кирилл","Константин",
													"Лео","Леонид","Людвиг","Майкл","Максим","Марат","Марк","Модест",
													"Никита","Николай","Николас","Олег","Оскар","Отто","Павел","Петр",
													"Пол","Рауф","Ричард","Роберт","Роман","Рубен","Руслан","Рустам",
													"Семен","Сергей","Станислав","Степан","Тимур","Федор","Феликс",
													"Филипп","Шамиль","Эдуард","Эмиль","Эльдар","Юрий","Ян"
													];
		public static function fillMaleBotNameArray (Name:String)
		{
			botMaleNameArray.push(Name);
			
			
		}
		public static var botMaleLastNameArray:Array = ["Авдотьев","Алиев","Андреев","Аникеев","Антипенко","Башаров",
														"Бергман","Борисов","Браун","Бруни","Будрайтис","Винздор",
														"Вюйар","Голиков","Дауни","Еремеев","Зиялеттдинов","Искандеров",
														"Кавалли","Карден","Карлсон","Королев","Коупленд","Кошелев",
														"Красиков","Курочкин","Лемешев","Литвинов","Маккинли","Маклауд",
														"Маршалл","Онищенко","Петров","Подберезовиков","Подосиновиков",
														"Попков","Раков","Ричардсон","Руденко","Рыков","Савельев",
														"Саган","Сандерс","Стенли","Тайлер","Траут","Уфаев","Фаулз",
														"Федорцов","Феодоринов","Филиппов","Франко","Фурсенко",
														"Хубутия","Шариков","Шварц","Шекли","Шелл","Щукин","Янглин"
														];
		public static function fillMaleBotLastNameArray (Name:String)
		{
			botMaleLastNameArray.push(Name);
			
		}
		
		public static function getBotFio (nId:Number, lnId:Number, gender:Number)
		{
			var req:String = ""
			if (gender == 1) {
				req = botMaleNameArray[nId] + " " + botMaleLastNameArray[lnId]
			}
			if (gender == 2) {
				req = botFemaleNameArray[nId] + " " + botFemaleLastNameArray[lnId]
			}
			return req
		}
		
		public static function getBotNameId (gender:Number) {
			var req:Number = 0
			if (gender == 1) {
				req = Math.ceil (Math.random ()*stringCollector.botMaleNameArray.length)-1
			}
			if (gender == 2) {
				req = Math.ceil (Math.random ()*stringCollector.botFemaleNameArray.length)-1
			}
			return req
		}
		public static function getBotLastNameId (gender:Number) {
			var req:Number = 0
			if (gender == 1) {
				req = Math.ceil (Math.random ()*stringCollector.botMaleLastNameArray.length)-1
			}
			if (gender == 2) {
				req = Math.ceil (Math.random ()*stringCollector.botFemaleLastNameArray.length)-1
			}
			return req
		}
	}

}