//HomeWork 2.1 Classes and structers, enums
//Task #1
/*
 Представьте себя инженером проектировщиком телевизоров во времена, когда эпоха телевещания только набирала обороты. Вам поступила задача создать устройство для просмотра эфира в домашних условиях "Телевизор в каждую семью".

 Вам нужно реализовать перечисление "Телевизионный канал" с 5-7 каналами.

 Алгоритм выполнения

 Реализуйте класс "Телевизор". У него должны быть состояния:
 фирма/модель (реализовать одним полем);
 включен/выключен;
 текущий телеканал;
 У него должно быть поведение:

 показать, что сейчас по телеку
 Вызовите метод и покажите, что сейчас по телеку.

 Сделайте изменение состояний телевизора (на свой выбор).

 Повторите вызов метода и покажите, что сейчас по телеку.
 */

enum TVChannels {
    case MTV, CTC, TNT, RenTV, ORT, NTV
}

class TV {
    var model: (String, String)
    var power: Bool
    var showCurrentChannel: TVChannels
    
    func whatOnDisplay () {
        if power {
            print("Right now you watching - \(showCurrentChannel) channel") }
        else {
            print("Turn on your TV")
        }
    }
    init(model: (String, String), power: Bool, showCurrentChannel: TVChannels) {
        self.model = model
        self.power = power
        self.showCurrentChannel = showCurrentChannel
    }
}

var samsungTV = TV (model: ("Samsung", "123") , power: false, showCurrentChannel: TVChannels.MTV)
print(samsungTV.model)
samsungTV.whatOnDisplay()
samsungTV.power = true
samsungTV.showCurrentChannel = TVChannels.RenTV
samsungTV.whatOnDisplay()

//Task #2

/*
 Время идет, рынок и потребители развиваются, и ваша компания набирает ритм. Поступают все новые и новые требования к эволюции устройств. Перед вами снова инженерная задача — обеспечить пользователей практичным устройством.

 Алгоритм выполнения

 Реализуйте структуру настроек:
 громкость от 0 до 1, подумайте, какой тип использовать;
 показывать цветом или черно-белым, подумайте, какой тип данных лучше всего использовать.
 Интегрируйте Настройки в класс Телевизор.

 Вызовите метод и покажите, что сейчас по телеку.


 */

struct Settings {
    var volume: Float = 0
    var colorScreen: Bool
    
    mutating func volumeUP () {
        if volume+0.1 <= 1 {
            self.volume+=0.1
        }
    }
    mutating func volumeDown () {
        if volume-0.1 >= 0 {
            self.volume-=0.1
        }
    }
    
    init(volume: Float, colorScreen: Bool) {
        self.volume = volume
        self.colorScreen = colorScreen
    }
}

class TVV2 : TV {
    var settings: Settings
    
    override func whatOnDisplay() {
        
        if power {
            if settings.colorScreen { print("Your TV shows color channel")}
            else {
                print("Your TV shows black-white channel")
            }
            print("Right now you watching - \(showCurrentChannel) channel on volume \(settings.volume)") }
        else {
            print("Turn on your TV")
        }
    }
    init(model: (String, String), power: Bool, showCurrentChannel: TVChannels, settings: Settings) {
        self.settings = settings
        super.init(model: model, power: power, showCurrentChannel: showCurrentChannel)
    }
}

var settingsSony = Settings (volume: 0.5, colorScreen: true)
var sonyTV = TVV2 (model: ("Sony","123"), power: false, showCurrentChannel: TVChannels.NTV, settings: settingsSony)

print()
print(sonyTV.model)
sonyTV.whatOnDisplay()
sonyTV.power = true
sonyTV.settings.volumeUP()
sonyTV.whatOnDisplay()

//Task #3
/*
 Порог новой эры пройден. Теперь не только есть радио волна, но и видео магнитофоны. Эту технику подключают проводами к телевизору и смотрят в записи свои любимые фильмы. Вам, как ведущему инженеру, срочно нужно адаптировать продукт вашей компании, потому как спрос на устаревший вариант резко пошел вниз.
 
 Алгоритм выполнения

 Создайте перечисление со связанными значениями с двумя кейсами:
 телеканал;
 подключение по входящему видео порту;
 Интегрируйте эту опцию в Телевизор (используйте наследование).

 Вызовите метод и покажите, что сейчас по телевизору.
 */

enum someEnum {
    enum TVChannels {
        case MTV, CTC, TNT, RenTV, ORT, NTV
    }
    enum Connection {
        case VGA, DisplayPort, HDMI, DVI
    }
}

class TVV3: TVV2 {
    
    var showBoth: (someEnum.TVChannels,someEnum.Connection)

    
    override func whatOnDisplay() {
        
        if power {
            if settings.colorScreen { print("Your TV shows color channel")}
            else {
                print("Your TV shows black-white channel")
            }
            print("Right now you watching - \(showBoth.0) channel on volume \(settings.volume) in use \(showBoth.1)") }
        else {
            print("Turn on your TV")
        }
    }
    
    
    
     init(model: (String, String), power: Bool, showCurrentChannel: TVChannels, settings: Settings, showBoth: (someEnum.TVChannels, someEnum.Connection)) {
        self.showBoth = showBoth
        super.init(model: model, power: power, showCurrentChannel: showCurrentChannel, settings: settings)
    }
}

var exampleTTV3 = TVV3(model: ("Example","999"), power: true, showCurrentChannel: TVChannels.CTC, settings: settingsSony, showBoth: (someEnum.TVChannels.CTC,someEnum.Connection.DisplayPort))

print()
print(exampleTTV3.model)
print(exampleTTV3.showBoth.0,exampleTTV3.showBoth.1)

exampleTTV3.whatOnDisplay()
