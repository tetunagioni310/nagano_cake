# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'example@gmail.com',
   password: 'password'
)


Customer.create!(
   
   {
   last_name: '山田',
   first_name: '花子',
   last_name_kana: 'ヤマダ',
   first_name_kana: 'ハナコ',
   email: 'test@test.com',
   password: 'testtest',
   postal_code: '1500041',
   address: '東京都渋谷区神南一丁目19-11 パークウェースクエア24階',
   telephone_number: '0398694700',
   is_deleted: 'false'
   }
)

Genre.create!(
   [
    { name: 'ケーキ' },
    { name: 'プリン'},
    { name: '焼き菓子' },
    { name: 'キャンディ' }
   ]
)

Item.create!(
   
    [
       { name: 'いちごのショートケーキ（ホール）',
         genre_id: '1',
         introduction: '栃木県のとちおとめを贅沢に使用しています。',
         price: '2500',
         is_active: 'true' },
      
       { name: 'ザッハトルテ',
         genre_id: '1',
         introduction: '',
         price: '2900',
         is_active: 'true' },
      
       { name: 'モンブラン',
         genre_id: '1',
         introduction: '',
         price: '500',
         is_active: 'true' },
         
       { name: 'フルーツタルト',
         genre_id: '1',
         introduction: '',
         price: '2900',
         is_active: 'true' },
         
       { name: 'バナナケーキ',
         genre_id: '1',
         introduction: '',
         price: '980',
         is_active: 'true' },
         
       { name: '洋梨のチーズタルト',
         genre_id: '1',
         introduction: '',
         price: '1200',
         is_active: 'true' },
         
       { name: '卵たっぷり濃厚プリン',
         genre_id: '2',
         introduction: '',
         price: '500',
         is_active: 'true' },
         
       { name: 'かぼちゃのプリン',
         genre_id: '2',
         introduction: '',
         price: '480',
         is_active: 'true' },
         
       { name: '紅茶のクッキー',
         genre_id: '3',
         introduction: '',
         price: '800',
         is_active: 'true' },
         
       { name: 'マカロンセット（８個）',
         genre_id: '1',
         introduction: '',
         price: '1200',
         is_active: 'true' },
         
       { name: 'マカロンセット（16個）',
         genre_id: '1',
         introduction: '',
         price: '2000',
         is_active: 'true' }
    ]
    
)