module BCDice
  module GameSystem
    class MeikyuKingdom
      # 迷宮風景決定表
      def mk_ls_decide_table(num)
        output = ""
        num.times do |_i|
          output += "「" + mk_landscape_table(@randomizer.roll_once(6)) + "」"
        end
        return output
      end

      # 迷宮風景表(1D6)
      def mk_landscape_table(num)
        dice = @randomizer.roll_d66(D66SortType::ASC)
        table = [
          [1, lambda { mk_artifact_landscape_table(dice) }],
          [2, lambda { mk_cave_landscape_table(dice) }],
          [3, lambda { mk_natural_landscape_table(dice) }],
          [4, lambda { mk_waterside_landscape_table(dice) }],
          [5, lambda { mk_skyrealm_landscape_table(dice) }],
          [6, lambda { mk_strange_place_landscape_table(dice) }],
        ]
        return get_table_by_number(num, table)
      end

      # 人工風景表(D66)
      def mk_artifact_landscape_table(num)
        table = [
          [11, "石組みの部屋"],
          [12, "巨大な縦穴に刻まれた螺旋階段"],
          [13, "埃だらけの古い図書館"],
          [14, "古びた、素朴な祭壇"],
          [15, "歯車やピストンがやかましい動力室"],
          [16, "石組みの巨大な階段"],
          [22, "太い丸太で組まれた部屋"],
          [23, "作りかけの製品が放置された工房"],
          [24, "錆びた武器や骨が散らばる古戦場"],
          [25, "石組みのトイレ"],
          [26, "高い天井の厨房"],
          [33, "レンガで組まれた部屋"],
          [34, "静まりかえった劇場"],
          [35, "がらくたが散らばっているゴミ捨て場"],
          [36, "切り出し途中で放棄された巨大な石像"],
          [44, "壁画やタペストリーが残る大広間"],
          [45, "メトロ汗国の線路"],
          [46, "絵画や彫刻が展示してあるギャラリー"],
          [55, "石棺が並ぶ墓"],
          [56, "錆びついた扉が残る巨大な門"],
          [66, "放置された牢獄"],
        ]
        return get_table_by_number(num, table)
      end

      # 洞窟風景表(D66)
      def mk_cave_landscape_table(num)
        table = [
          [11, "岩肌がむき出しの洞穴"],
          [12, "コウモリや羽蟲が飛び交う洞穴"],
          [13, "放置された坑道"],
          [14, "誰かのキャンプ跡"],
          [15, "岩だらけで見通しのきかない空洞"],
          [16, "煙が吹きぬける洞穴"],
          [22, "どこからか水音が響く鍾乳洞"],
          [23, "光の衰えた星がまたたく幻想的な空洞"],
          [24, "流砂が流れる洞穴"],
          [25, "生物が掘った、つるつるした洞穴"],
          [26, "冷えきった氷の洞穴"],
          [33, "巨大な岩の隙間"],
          [34, "動物や狩を描いた素朴な壁画が続く洞穴"],
          [35, "巨大な空洞にかけられた自然の橋"],
          [36, "埋まりかけで天井すれすれの洞穴"],
          [44, "奈落と断崖絶壁"],
          [45, "壁がうごめく蟲でおおわれた洞穴"],
          [46, "無数の化石が埋まっている洞穴"],
          [55, "熱気を放つ溶岩が流れる空洞"],
          [56, "水晶でできた洞穴"],
          [66, "骨が散らばるなにものかの住処"],
        ]
        return get_table_by_number(num, table)
      end

      # 自然風景表(D66)
      def mk_natural_landscape_table(num)
        table = [
          [11, "苔むした部屋"],
          [12, "動物の声が響き渡る密林"],
          [13, "つる草でできた通路"],
          [14, "空洞いっぱいのお花畑"],
          [15, "壁から木の根が突き出している部屋"],
          [16, "空洞に広がる耕作地"],
          [22, "折り重なって繁茂する森林"],
          [23, "垂直の空洞にえんえんと伸びる大木の幹"],
          [24, "空洞中に広がるアザラシの営巣地"],
          [25, "カビで壁がねとつく部屋"],
          [26, "サボテンが点在する部屋"],
          [33, "巨大キノコの群生地"],
          [34, "真ん中に大木が一本そびえ立っている空洞"],
          [35, "通路いっぱいに進む野生ウマトカゲの大群"],
          [36, "落ち葉がうずたかく積もった部屋"],
          [44, "植え込みで作られた迷宮庭園"],
          [45, "生い茂る竹林"],
          [46, "松ぼっくりが転がる部屋"],
          [55, "丈の長い草が生い茂る部屋"],
          [56, "枯れた森林"],
          [66, "大木の空洞内のような通路や部屋"],
        ]
        return get_table_by_number(num, table)
      end

      # 水域風景表(D66)
      def mk_waterside_landscape_table(num)
        table = [
          [11, "轟々と流れる川にかかった橋"],
          [12, "色とりどりの珊瑚の中"],
          [13, "腰高まで水に浸かった部屋"],
          [14, "澄んだ水が流れる噴水と水飲み場"],
          [15, "沸騰する湖"],
          [16, "地面が干潟化した部屋"],
          [22, "水をたたえた貯水池"],
          [23, "熱い蒸気がたちこめる部屋"],
          [24, "空洞に広がる沼地"],
          [25, "樽や鎖が放置されている船の中"],
          [26, "水槽が並ぶ水族館"],
          [33, "悪臭を放つ下水道"],
          [34, "底に遺跡が見える水没した空洞"],
          [35, "桟橋と船着き場"],
          [36, "筏やハシケが浮かぶ湖"],
          [44, "巨大な縦穴と滝"],
          [45, "かつて建設された上水道の中"],
          [46, "ペンギンの右往左往する氷結した湖"],
          [55, "湯気を立てる温泉"],
          [56, "奇怪な彫刻が施された古井戸"],
          [66, "壁に貝やフジツボがはりついた部屋"],
        ]
        return get_table_by_number(num, table)
      end

      # 天空風景表(D66)
      def mk_skyrealm_landscape_table(num)
        table = [
          [11, "雨が降る部屋"],
          [12, "チーズにうがたれた洞穴"],
          [13, "中空に何層にも重なる空中庭園"],
          [14, "無限に連なる真っ白な洗濯物"],
          [15, "天空に向かって伸びる豆の木"],
          [16, "巨大な縦穴にぶら下がる縄ばしごや鎖"],
          [22, "強風の吹き荒れる部屋"],
          [23, "雲の上。なぜか、その上を歩くことができる"],
          [24, "濃霧に覆われた空洞"],
          [25, "無重量でふわふわ浮く部屋"],
          [26, "雪がしんしんと降り積もる部屋"],
          [33, "時空がねじ曲がった空中回廊"],
          [34, "怪物よけの風車が音を立てる通路"],
          [35, "天井に遺跡が見える空洞"],
          [36, "轟々と音を立てる巨大排気孔"],
          [44, "時折稲妻の走る部屋"],
          [45, "鳥の羽毛が舞い落ちる部屋"],
          [46, "青空が壁面いっぱいに描かれた空洞"],
          [55, "一面、鏡でできた部屋"],
          [56, "オーロラがゆらめく空洞"],
          [66, "重力方向がばらばらの部屋"],
        ]
        return get_table_by_number(num, table)
      end

      # 異界風景表(D66)
      def mk_strange_place_landscape_table(num)
        table = [
          [11, "古びた六畳間"],
          [12, "せせこましいカラオケボックス"],
          [13, "時の止まった街"],
          [14, "ボールが一個転がっている体育館"],
          [15, "毛が生えている部屋"],
          [16, "なにかの待合室"],
          [22, "生物の粘液したたる体内"],
          [23, "ブランコやすべり台のある小公園"],
          [24, "安っぽいユニットバス"],
          [25, "上の住人がうるさい部屋"],
          [26, "人骨で組まれている部屋"],
          [33, "呼吸している部屋"],
          [34, "斜めに傾いた部屋"],
          [35, "ラブホテルの一室"],
          [36, "ときどきなにかが覗いていく部屋"],
          [44, "がやがやと話し声が聞こえる部屋"],
          [45, "触手が生えている部屋"],
          [46, "机と椅子が置いてある取調室"],
          [55, "静まりかえった教室"],
          [56, "天井に巨大な人の顔がある部屋"],
          [66, "常に揺れている部屋"],
        ]
        return get_table_by_number(num, table)
      end
    end
  end
end