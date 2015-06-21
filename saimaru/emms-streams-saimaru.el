;;; emms-streams-saimaru.el --- emms stream list for SaimaruRadio -*- lexical-binding: t -*-

;; Copyright (C) 2015 momomo5717

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by

;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This provides emms stream list for SaimaruRadio.

;;; Code:
(require 'emms-streams)
(require 'cl-lib)

(defvar emms-stream-saimaru-hokkaido
  '(("三角山放送局 : 札幌市西区 : 北海道" "saimaru://http://wm.sankakuyama.co.jp/asx/sankaku_24k.asx" 1 streamlist)
    ("FM JAGA : 帯広市 : 北海道" "saimaru://http://www.simulradio.info/asx/fmjaga.asx" 1 streamlist)
    ("FM WING : 帯広市 : 北海道" "saimaru://http://www.simulradio.info/asx/fmwing.asx" 1 streamlist)
    ("RadioD FM dramacity : 札幌市厚別区 : 北海道" "saimaru://http://dramacity.jp/fmdorama_24k.asx" 1 streamlist)
    ("FMくしろ : 釧路市 : 北海道" "saimaru://http://www.simulradio.info/asx/FmKushiro.asx" 1 streamlist)
    ("FMわっぴ～ : 稚内市 : 北海道" "saimaru://http://wappy761.jp/fmwappy.asx" 1 streamlist)
    ("FMりべーる : 旭川市 : 北海道" "saimaru://http://www.simulradio.info/asx/fm837.asx" 1 streamlist)
    ("ラジオニセコ : ニセコ町 : 北海道" "saimaru://http://www.radioniseko.jp/asx/radioniseko_24k.asx" 1 streamlist)
    ("FMいるか : 函館市 : 北海道" "saimaru://http://www.simulradio.info/asx/iruka.asx" 1 streamlist)
    ("ラジオカロスサッポロ : 札幌市 : 北海道" "saimaru://http://www.simulradio.info/asx/radiokaros.asx" 1 streamlist)
    ("FMアップル : 札幌市豊平区 : 北海道" "saimaru://http://www.simulradio.info/asx/fmapple.asx" 1 streamlist)
    ("e-niwaFM : 恵庭市 : 北海道" "saimaru://http://www.simulradio.info/asx/eniwa.asx" 1 streamlist))
  "Stream list of hokkaido area.")

(defvar emms-stream-saimaru-touhoku
  '(("ラヂオもりおか : 盛岡市 : 東北 : 災害対応局" "saimaru://http://www.simulradio.info/asx/radiomorioka.asx" 1 streamlist)
    ("RADIO3 : 仙台市青葉区 : 東北 : 災害対応局" "saimaru://http://www.simulradio.info/asx/radio3.asx" 1 streamlist)
    ("エフエム モットコム : 本宮市 : 東北 : 災害対応局" "saimaru://http://www.simulradio.info/asx/fmmotcom.asx" 1 streamlist)
    ("FMいわき : いわき市 : 東北 : 災害対応局" "saimaru://http://www.simulradio.info/asx/fm-iwaki.asx" 1 streamlist)
    ("エフエム会津 : 会津若松市 : 東北" "saimaru://http://www.simulradio.info/asx/aizu.asx" 1 streamlist)
    ("FMゆーとぴあ : 湯沢市 : 東北" "saimaru://http://www.simulradio.info/asx/FmYutopia.asx" 1 streamlist)
    ("横手かまくらエフエム : 横手市 : 東北" "saimaru://http://www.simulradio.info/asx/yokote.asx" 1 streamlist)
    ("みやこハーバーラジオ : 宮古市 : 東北 : 災害対応局" "saimaru://http://www.simulradio.info/asx/FmMiyako.asx" 1 streamlist)
    ("ラジオ石巻 : 石巻市 : 東北" "saimaru://http://www.simulradio.info/asx/RadioIshinomaki.asx" 1 streamlist)
    ("BAY WAVE : 塩釜市 : 東北" "saimaru://http://www.simulradio.info/asx/BAYWAVE.asx" 1 streamlist)
    ("fmいずみ : 仙台市泉区 : 東北 : 災害対応局" "saimaru://http://www.simulradio.info/asx/fmIzumi.asx" 1 streamlist)
    ("りんごFM : 山元町 : 東北" "saimaru://http://www.simulradio.info/asx/RingoFM.asx" 1 streamlist)
    ("なとらじ : 名取市 : 東北" "saimaru://http://www.simulradio.info/asx/Natoraji.asx" 1 streamlist)
    ("南相馬ひばりエフエム : 南相馬市 : 東北" "saimaru://http://www.simulradio.info/asx/MinamisomaFM.asx" 1 streamlist)
    ("郡山コミュニティ放送 : 郡山市 : 東北 : 災害対応局" "saimaru://http://www.simulradio.info/asx/kocofm.asx" 1 streamlist)
    ("女川さいがいFM : 女川町 : 東北" "saimaru://http://www.simulradio.info/asx/OnagawaFM.asx" 1 streamlist)
    ("けせんぬまさいがいエフエム : 気仙沼市 : 東北" "saimaru://http://www.simulradio.info/asx/kesennumaFM.asx" 1 streamlist)
    ("陸前高田災害FM : 陸前高田市 : 東北" "saimaru://http://www.simulradio.info/asx/rikuzentakataFM.asx" 1 streamlist)
    ("富岡臨時災害FM局（おだがいさまFM） : 富岡町 : 東北" "saimaru://http://www.simulradio.info/asx/OdagaisamaFM.asx" 1 streamlist)
    ("亘理臨時災害FM局（FMあおぞら） : 亘理町 : 東北" "saimaru://http://www.simulradio.info/asx/aozora.asx" 1 streamlist)
    ("FMねまらいん : 大船渡市 : 東北" "saimaru://mms://hdv.nkansai.tv/ofunato" 1 streamlist)
    ("おおつちさいがいエフエム : 大槌町 : 東北" "saimaru://http://www.simulradio.info/asx/otsuchi.asx" 1 streamlist)
    ("釜石災害FM : 釜石市 : 東北" "saimaru://http://www.simulradio.info/asx/kamaishi.asx" 1 streamlist)
    ("FMあすも : 一関市 : 東北" "saimaru://http://fmasmo.fmplapla.com/player/" 1 streamlist)
    ("BeFM : 八戸市 : 東北" "saimaru://http://www.simulradio.info/asx/befm.asx" 1 streamlist)
    ("鹿角きりたんぽFM : 鹿角市 : 東北" "saimaru://http://www.simulradio.info/asx/kiritampo.asx" 1 streamlist))
  "Stream list of touhoku area.")

(defvar emms-stream-saimaru-shinetsu
  '(("FM Kento : 新潟市中央区 : 信越" "saimaru://http://www.simulradio.info/asx/fmkento.asx" 1 streamlist)
    ("FM軽井沢 : 軽井沢町 : 信越" "saimaru://http://www.simulradio.info/asx/fmkaruizawa.asx" 1 streamlist)
    ("FMさくだいら : 佐久市 : 信越" "saimaru://http://www.simulradio.info/asx/sakudaira.asx" 1 streamlist)
    ("あづみ野FM : 安曇野市 : 信越" "saimaru://http://www.simulradio.info/asx/azumino.asx" 1 streamlist))
  "Stream list of shinetsu area.")

(defvar emms-stream-saimaru-kantou
  '(("FMぱるるん : 水戸市 : 関東 : 災害対応局" "saimaru://http://www.simulradio.info/asx/fmpalulun.asx" 1 streamlist)
    ("フラワーラジオ : 鴻巣市 : 関東" "saimaru://http://www.fm767.com/flower_64k.asx" 1 streamlist)
    ("すまいるFM : 朝霞市 : 関東" "saimaru://http://www.simulradio.info/asx/smile.asx" 1 streamlist)
    ("湘南ビーチFM : 逗子市・葉山町 : 関東" "saimaru://http://www.simulradio.info/asx/shonanbeachfm.asx" 1 streamlist)
    ("レディオ湘南 : 藤沢市 : 関東" "saimaru://http://www.simulradio.info/asx/radioshonan.asx" 1 streamlist)
    ("FMおだわら : 小田原市 : 関東" "saimaru://http://www.simulradio.info/asx/fmodawara.asx" 1 streamlist)
    ("REDS WAVE : さいたま市 : 関東" "saimaru://http://redswave.com/simul.asx" 1 streamlist)
    ("ラヂオつくば : つくば市 : 関東 : 災害対応局" "saimaru://http://www.simulradio.info/asx/tsukuba.asx" 1 streamlist)
    ("エフエムたちかわ : 立川市 : 関東" "saimaru://http://www.simulradio.info/asx/fm-tachikawa.asx" 1 streamlist)
    ("かわさきFM : 川崎市 : 関東" "saimaru://http://www.simulradio.info/asx/kawasaki.asx" 1 streamlist)
    ("FM 桐生 : 桐生市 : 関東" "saimaru://http://www.simulradio.info/asx/kiryufm.asx" 1 streamlist)
    ("FMやまと : 大和市 : 関東" "saimaru://http://www.simulradio.info/asx/FmYamato.asx" 1 streamlist)
    ("FM戸塚 : 横浜市 : 関東" "saimaru://http://www.simulradio.info/asx/totsuka.asx" 1 streamlist)
    ("FMサルース : 横浜市 : 関東" "saimaru://http://www.simulradio.info/asx/FmSalus.asx" 1 streamlist)
    ("調布FM : 調布市 : 関東" "saimaru://http://www.simulradio.info/asx/chofu_fm.asx" 1 streamlist)
    ("まえばしCITYエフエム : 前橋市 : 関東" "saimaru://http://radio.maebashi.fm:8080/mwave" 1 streamlist)
    ("かつしかFM : 葛飾区 : 関東" "saimaru://http://www.simulradio.info/asx/katsushika.asx" 1 streamlist)
    ("エフエムさがみ : 相模原市 : 関東" "saimaru://http://www.fmsagami.co.jp/asx/fmsagami.asx" 1 streamlist)
    ("レインボータウンFM : 江東区 : 関東" "saimaru://http://www.simulradio.info/asx/rainbowtown.asx" 1 streamlist)
    ("FM kaon : 海老名市 : 関東" "saimaru://mms://hdv.nkansai.tv/kaon" 1 streamlist)
    ("中央エフエム : 中央区 : 関東" "saimaru://http://www.simulradio.info/asx/chuo_fm.asx" 1 streamlist)
    ("たかはぎFM : 高萩市 : 関東" "saimaru://http://www.simulradio.info/asx/takahagi.asx" 1 streamlist) )
  "Stream list of kantou area.")

(defvar emms-stream-saimaru-toukai
  '(("PORT WAVE : 四日市市 : 東海" "saimaru://http://www.simulradio.info/asx/portwavefm.asx" 1 streamlist)
    ("Ciao! : 熱海市 : 東海" "saimaru://http://www.simulradio.info/asx/ciao.asx" 1 streamlist)
    ("MID-FM : 名古屋市中区 : 東海" "saimaru://http://www.simulradio.info/asx/mid-fm761.asx" 1 streamlist)
    ("FMおかざき : 岡崎市 : 東海" "saimaru://http://www.simulradio.info/asx/FmOkazaki.asx" 1 streamlist)
    ("Pitch FM : 刈谷市 : 東海" "saimaru://http://www.simulradio.info/asx/pitch.asx" 1 streamlist)
    ("RADIO LOVEAT : 豊田市 : 東海" "saimaru://http://www.simulradio.info/asx/toyota.asx" 1 streamlist)
    ("Suzuka Voice FM : 鈴鹿市 : 東海" "saimaru://http://www.simulradio.info/asx/suzuka.asx" 1 streamlist)
    ("FMいずのくに : 伊豆の国市 : 東海" "saimaru://http://www.simulradio.info/asx/izunokuni.asx" 1 streamlist))
  "Stream list of toukai area.")

(defvar emms-stream-saimaru-hokuriku
  '(("FM-N1 : 野々市市 : 北陸" "saimaru://http://android.fmn1.jp/live/" 1 streamlist)
    ("ハーバーステーション : 敦賀市 : 北陸" "saimaru://http://www.web-services.jp/harbor779/" 1 streamlist)
    ("ラジオ・ミュー : 黒部市 : 北陸" "saimaru://http://www.simulradio.info/asx/radiomyu.asx" 1 streamlist))
  "Stream list of hokuriku area.")

(defvar emms-stream-saimaru-kinki
  '(("FM丹波 : 福知山市 : 近畿" "saimaru://http://fukuchiyama.fm-tanba.jp/simul.asx" 1 streamlist)
    ("FM 千里 : 豊中市 : 近畿" "saimaru://http://www.simulradio.info/asx/fmsenri.asx" 1 streamlist)
    ("エフエムわいわい : 神戸市 : 近畿" "saimaru://http://www.simulradio.info/asx/fmyy.asx" 1 streamlist)
    ("FM HANAKO : 守口市 : 近畿" "saimaru://http://fmhanako.jp/radio/824.asx" 1 streamlist)
    ("エフエム　みっきぃ : 三木市 : 近畿" "saimaru://http://www.simulradio.info/asx/fm-miki.asx" 1 streamlist)
    ("FMひらかた : 枚方市 : 近畿" "saimaru://http://www.simulradio.info/asx/hirakata.asx" 1 streamlist)
    ("FM GENKI : 姫路市 : 近畿" "saimaru://http://www.simulradio.info/asx/fm-genki.asx" 1 streamlist)
    ("FM TANABE : 田辺市 : 近畿" "saimaru://http://www.simulradio.info/asx/fm-tanabe.asx" 1 streamlist)
    ("FMジャングル : 豊岡市 : 近畿" "saimaru://http://www.simulradio.info/asx/jungle.asx" 1 streamlist)
    ("BAN-BANラジオ : 加古川市 : 近畿" "saimaru://http://www.simulradio.info/asx/banban.asx" 1 streamlist)
    ("FM宝塚 : 宝塚市 : 近畿" "saimaru://http://www.simulradio.info/asx/takarazuka.asx" 1 streamlist)
    ("FMビーチステーション : 白浜町 : 近畿" "saimaru://http://www.simulradio.info/asx/beach_station.asx" 1 streamlist)
    ("みのおエフエム : 箕面市 : 近畿" "saimaru://http://fm.minoh.net/minohfm.asx" 1 streamlist)
    ("YES-fm : 大阪市中央区 : 近畿" "saimaru://http://www.simulradio.info/asx/yes-fm.asx" 1 streamlist)
    ("京都リビングエフエム : 京都市伏見区 : 近畿" "saimaru://http://www.simulradio.info/asx/KyotoLivingFM.asx" 1 streamlist)
    ("さくらFM : 西宮市 : 近畿" "saimaru://http://www.simulradio.info/asx/sakura.asx" 1 streamlist)
    ("エフエムあまがさき : 尼崎市 : 近畿" "saimaru://http://www.simulradio.info/asx/aiai.asx" 1 streamlist)
    ("えふえむ草津 : 草津市 : 近畿" "saimaru://http://www.simulradio.info/asx/rockets785.asx" 1 streamlist)
    ("FMはしもと : 橋本市 : 近畿" "saimaru://http://www.simulradio.info/asx/hasimoto.asx" 1 streamlist)
    ("京都三条ラジオカフェ : 京都市中京区 : 近畿" "saimaru://http://www.simulradio.info/asx/radiocafe.asx" 1 streamlist)
    ("たんばしさいがいFM : 丹波市 : 近畿" "saimaru://http://www.simulradio.info/asx/tanbacom.asx" 1 streamlist)
    ("FMたんご : 京丹後市 : 近畿" "saimaru://http://www.simulradio.info/asx/tango.asx" 1 streamlist)
    ("FM MOOV KOBE : 神戸市 : 近畿" "saimaru://http://www.simulradio.info/asx/fmmoov.asx" 1 streamlist) )
  "Stream list of kinki area.")

(defvar emms-stream-saimaru-chugoku
  '(("FMちゅーピー : 広島市 : 中国" "saimaru://http://www.simulradio.info/asx/fm-chupea.asx" 1 streamlist)
   ("DARAZ FM : 米子市 : 中国" "saimaru://http://www.darazfm.com/streaming.asx" 1 streamlist))
  "Stream list of chugoku area.")

(defvar emms-stream-saimaru-shikoku
  '(("FM高松 : 高松市 : 四国" "saimaru://http://www.simulradio.info/asx/fm815.asx" 1 streamlist)
    ("FMびざん : 徳島市 : 四国" "saimaru://http://www.simulradio.info/asx/b-fm791.asx" 1 streamlist)
    ("FM SUN : 坂出市 : 四国" "saimaru://http://www.simulradio.info/asx/fmsun.asx" 1 streamlist))
  "Stream list of shikoku area.")

(defvar emms-stream-saimaru-kyusyu
  '(("NOAS FM : 中津市 : 九州" "saimaru://http://www.simulradio.info/asx/fmnakatsu.asx" 1 streamlist)
    ("サンシャイン エフエム : 宮崎市 : 九州" "saimaru://http://www.simulradio.info/asx/sunshinefm.asx" 1 streamlist)
    ("あまみFM : 奄美市 : 九州" "saimaru://http://www.npo-d.org/simul/AmamiFM.asx" 1 streamlist)
    ("FMしまばら : 島原市 : 九州" "saimaru://http://www.shimabara.fm/st/fm-shimabara-live.asx" 1 streamlist)
    ("FM KITAQ : 北九州市小倉北区 : 九州" "saimaru://http://www.shimabara.fm/st/fm-kitaq-live.asx" 1 streamlist)
    ("スターコーンFM : 築上郡築上町 : 九州" "saimaru://mms://hdv.nkansai.tv/starcorn" 1 streamlist)
    ("コミュニティラジオ天神 : 福岡市 : 九州" "saimaru://http://comiten.jp/live.asx" 1 streamlist)
    ("AIR STATION HIBIKI : 北九州市 : 九州" "saimaru://http://www.simulradio.info/asx/hibiki.asx" 1 streamlist)
    ("FMのべおか : 延岡市 : 九州" "saimaru://http://www.simulradio.info/asx/nobeoka.asx" 1 streamlist))
  "Stream list of kyusyu area.")

(defvar emms-stream-saimaru-okinawa
  '(("エフエム ニライ : 北谷町 : 沖縄" "saimaru://http://www.simulradio.info/asx/fm-nirai.asx" 1 streamlist)
    ("FMいしがき : 石垣市 : 沖縄" "saimaru://http://118.21.140.45/Push1" 1 streamlist)
    ("FMうるま : うるま市 : 沖縄" "saimaru://http://www.simulradio.info/asx/uruma.asx" 1 streamlist)
    ("FM21 : 浦添市 : 沖縄" "saimaru://http://www.simulradio.info/asx/fm21.asx" 1 streamlist)
    ("FMレキオ : 那覇市 : 沖縄" "saimaru://http://www.simulradio.info/asx/lequio.asx" 1 streamlist)
    ("FMとよみ : 豊見城市 : 沖縄" "saimaru://http://www.simulradio.info/asx/toyomi.asx" 1 streamlist)
    ("オキラジ : 沖縄市 : 沖縄" "saimaru://http://www.simulradio.info/asx/okiradi.asx" 1 streamlist)
    ("FMなんじょう : 南城市 : 沖縄" "saimaru://http://www.simulradio.info/asx/nanjo.asx" 1 streamlist)
    ("FMもとぶ : 本部町 : 沖縄" "saimaru://http://www.simulradio.info/asx/motob.asx" 1 streamlist)
    ("FMくめじま : 久米島 : 沖縄" "saimaru://http://www.simulradio.info/asx/fmkumejima.asx" 1 streamlist))
  "Stream list of okinawa area.")

(defvar emms-stream-saimaru-streams-name
  '(emms-stream-saimaru-hokkaido
    emms-stream-saimaru-touhoku
    emms-stream-saimaru-shinetsu
    emms-stream-saimaru-kantou
    emms-stream-saimaru-toukai
    emms-stream-saimaru-hokuriku
    emms-stream-saimaru-kinki
    emms-stream-saimaru-chugoku
    emms-stream-saimaru-shikoku
    emms-stream-saimaru-kyusyu
    emms-stream-saimaru-okinawa)
  "Symbol list of SaimaruRadio streams name.")

;;;###autoload
(defun emms-stream-saimaru-add-bookmark ()
  "Create agqr bookmark, and insert it at point position.

If save,run `emms-stream-save-bookmarks-file' after."
  (interactive )
  (set-buffer (get-buffer-create emms-stream-buffer-name))
  (let* ((line  (emms-line-number-at-pos (point)))
         (index (+ (/ line 2) 1)))
    (dolist (streams-name emms-stream-saimaru-streams-name)
     (dolist (stream (symbol-value streams-name))
       (setq emms-stream-list (emms-stream-insert-at index stream
                                                     emms-stream-list))
       (cl-incf index)))
    (emms-stream-redisplay)
    (goto-char (point-min))
    (forward-line (1- line))))

(provide 'emms-streams-saimaru)
;;; emms-streams-saimaru.el ends here