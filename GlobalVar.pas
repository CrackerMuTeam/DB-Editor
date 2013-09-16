unit GlobalVar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,registry,inifiles, DB, ADODB;

type
  TVarForm = class(TForm)
    itemQuery: TADOQuery;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Type TChartype=record
  Num:integer;
  Nome:string;
  Inicial:integer;
end;
Type TPK=record
  Num:integer;
  Nome:string;
end;
Type TStatus=record
  Num:integer;
  Nome:string;
end;
Type TQuests=record
  Code:string;
  Nome:string;
end;
Type TGlobalConfig=class(TForm)
  procedure ExcellentTypes;
  procedure BasePK;
  procedure BaseStatus;
  procedure BaseChartype;
  procedure BaseQuests;
  procedure ValueConfigIni(s:string);
  procedure LerMdb;
  procedure arrayexp;
  function bytetohex(src: byte): string;
  function HexToInt(Hex : string) : Cardinal;

end;
type TItemMdbInfo=record
  Index:byte;
  Classe:byte;
  Nome:string;
  Tipo:string;
  X,Y:byte;
  Wearto:string;
  SetNumber:byte;
  SetItem:string;
  ExcOptionType:string;
end;
type TMdbInfo=record
  QuantidadedeItems:Integer;
  MdbItems:array of TitemMdbInfo;
end;

var
  VarForm: TVarForm;
  MdbInfo:TMdbInfo;
GlobalConfig:TGlobalConfig;
{Gravar Valores}
SQLFolder:string='';
Versao:String='CMT';
AccountSel:String='';
CharacterSel:String='';
{CMTedit.ini}
//[MuOnline]
mudsn:string='MuOnline';
muid:string='sa';
mupwd:string='';
catalog:string='MuOnline';
//[Me_MuOnline]
memudsn:string='MuOnlineJoinDb';
memuid:string='sa';
memupwd:string='';
mecatalog:string='MuOnline';   //Me_
//[Others]
vs:string='CMT';
mastercatalog:string='Master';
maxguilds:integer=10000;
FavoriteAccounts:boolean=true;
FavoriteCharacters:boolean=true;
FavoriteGuilds:boolean=true;
ViCurr:boolean=false;
itemhexcount:integer=20;
ItemHextype:integer=1;
leveltotal:integer=400;
//[EcriptationUsage]
EncPass:boolean=false;
MSSQLBinnFolder:string='';
NonEncriptedCollumn:string='';
EncDll:String='WZ_MD5_MOD.dll';
//[ItemHexConfig]

Unique2Num:string;
//[UseLeaderPoint]
leadershipTable:string='Character';
LeaderShip:string='Leadership';
leadershipRef:string='name';
//[UseResets]
ResetsTable:string=''; //Character
Resets:string='';   //Resets
ResetsRef:string=''; //name
//[UseMultiVault]
MultiVaultTable:string='ExtWareHouse';   
MultiVaultMoney:string='Money';
MultiVaultId:string='AccountID';      
MultiVaultItems:string='Items';
MultiVaultNum:string='Number';
MultiVaultTotal:integer=4;
//[UsePersonalSotre]
PSTable:string='Character';
PSCollumn:string='Inventory';
PSRef:string='name';


levelexp:array of integer;
{Lang}
Programname:string='CMT DB Editor';
{Main Form}
{Account\Character}
AccountMenu:string='Account';
AccountLabel:string='Account:';
NewAccountHint:string='New Account';
RemAccountHint:string='Remove Account';
EditAccountHint:string='Edit Account';
EditVaultHint:string='Edit Account Vault(s)';
SaveAccountHint:string='Save Account to Favorites';
FavoritesAccountsHint:string='Favorites Accounts';
BlockAccountHint:string='Block Account';
FindAccountHint:string='Find Account';
InfoAccountHint:string='Account Information';

CharacterMenu:string='Character';
CharacterLabel:string='Character:';
NewCharacterHint:string='New Character';
RemCharacterHint:string='Remove Character';
EditCharacterHint:string='Edit Character';
EditInventoryHint:string='Edit Character Inventory';
EditMagicListHint:string='Edit Character MagicList';
SaveCharacterHint:string='Save Character to Favorites';
FavoritesCharactersHint:string='Favorites Characters';
BlockCharacterHint:string='Block Characters';
FindCharacterHint:string='Find Characters';
InfoCharacterHint:string='Character Information';

{Guilds}
GuildMenu:string='Guild';
GuildLabel:string='Guild:';
NewGuildHint:string='New Guild';
RemGuildHint:string='Remove Guild';
EditGuildHint:string='Edit Guild';
SaveGuildHint:string='Save Guild to Favorites';
FavoritesGuildsHint:string='Favorites Guild';
FindGuildHint:string='Find Guild';
GuildName:string='Guild Name: %s';
GuildMaster:string='Guild Master: %s';
GuildScore:string='Guild Score: %s';
GuildMembers:string='Guild Members:';




{Main Errors}
MainErrorCaption:string='Error!';
MainError1:string='The editor cannot delete the Account!';
MainError2:string='Please select an Account!';
MainError3:string='The Editor cannot find your favorite accounts!';
MainError4:string='The editor cannot delete the Character!';
MainError5:string='Please select an Character!';
MainError6:string='The Editor cannot find your favorite Characters!';
MainError7:string='The Editor cannot block/unblock this account!';
MainError8:string='The Editor cannot save this account to favorites!';
MainError9:string='The Editor cannot save this character to favorites!';
MainError10:string='The Editor cannot block/unblock this character!';
MainError11:string='The Editor cannot save this guild to favorites!';
MainError12:string='Please select an Guild!';
MainError13:string='The editor cannot delete the Guild!';

{Main Questions}
MainQuestion1:string='Are you sure you want to delete this Account?';
MainQuestion2:string='Are you sure you want to delete this Character?';
MainQuestion3:string='Are you sure you want to delete this Guild?';

{Main Confirms}
MainConfirm1:string='The Account ''%s'' was blocked!';
MainConfirm2:string='The Account ''%s'' was unblocked!';
MainConfirm3:string='The Account ''%s'' was saved to favorites!';
MainConfirm4:string='The Character ''%s'' was blocked!';
MainConfirm5:string='The Character ''%s'' was unblocked!';
MainConfirm6:string='The Character ''%s'' was saved to favorites!';
MainConfirm7:string='The Guild ''%s'' was saved to favorites!';

{Account Edit/Create}
AccountIDText:string='Account ID:';
PasswordText:string='Password:';
NameText:string='Name:';
SQuesText:string='Secret Question:';
SAnswText:string='Secret Answer:';
EmailText:string='E-mail:';
PersonalIdText:string='Personal ID:';
Encripton:string='Encriptation Status: Enabled';
Encriptoff:string='Encriptation Status: Disabled';
EditingAccount:string='Editing Account: %s';
CreatingAccount:string='Creating Account';
Okbtn:string='OK';
Cancelbtn:string='Cancel';

{Account Errors}
AccountErrorCaption:string='Error!';
AccountError1:string='The Account field cannot be erased!';
AccountError2:string='The Password field cannot be erased!';
AccountError3:string='This Account already exists!';

{New Guild Form}
AllCharacters:string='(All)';
NGuildName:string='Guild Name';
NGuildMark:string='Guild Mark';
NGuildGM:string='Game Master';
NGuildAccount:string='Account:';
NGuildCharacter:string='Character:';
NGuildCreate:string='Create Guild';
NGuildCreateEdit:string='Create Guild and Edit';
NGuildCancel:string='Cancel';

{NGuild Errors}
NGuildErrorCaption:string='Error!';
NGuildError1:string='The Guild Name Field Cannot be erased!';
NGuildError2:string='You have to select an character to be the guild master!';
NGuildError3:string='This guild already exists!';
NGuildError4:string='This guild already have 3 Battle Masters, remove one character from the list before adding a new one!';

{EGuild Form}
EGuildMaster:string='Guild Master';
EGuildAssistent:string='Assistent';
EGuildBattle:string='Battle Master';
EGuildNormal:string='Normal';
EGuildStatus:string='Character Status';
EGuildSetMaster:string='Set Guild Master';
EGuildSetAssistent:string='Set Assistent';
EGuildSetBattleMaster:string='Set Battle Master';
EGuildRemAssistent:string='Remove Assistent';
EGuildRemBattleMaster:string='Remove Battle Master';
EGuildRemoveMember:string='Remove Member';
{EGuild Questions}

{EGuild Confirm}
EGuildConfirm1:string='Character has been successfully removed from the guild!';
EGuildConfirm2:string='Character has been successfully added to the guild!';

{EGuild Errors}
EGuildErrorCaption:string='Error!';
EGuildError1:string='You cannot remove the guild master from the guild!';
EGuildError2:string='Select an Character to add on the guild!';
EGuildError3:string='This guild already have 1 Assistance Guild Master, remove that character from the list before adding a new one!';
EGuildError4:string='The Guild Name field cannot be erased!';

{EGuild Question}
EGuildQuestion1:string='Are you sure you want to remove this character from the guild?';
EGuildQuestion2:string='Are you sure you want to set this character as Guild Master?';
EGuildQuestion3:string='Are you sure you want to edit the guild name?';

{Find Form}
Find:string='Find';
FindTitleAccounts:string='Find Accounts';
FindTitleCharacters:string='Find Characters';
FindTitleGuilds:string='Find Guilds';
FavoriteTitleGuilds:string='Favorite Guilds';
FavoriteTitleAccounts:string='Favorite Accounts';
FavoriteTitleCharacters:string='Favorite Characters';
Results:string='Result';
RemFavorites:string='Remove';
InfoFavorites:string='Information';

{New Character}
NCharTitle:string='New Character';
NCharName:string='Name';
NCharClass:string='Class';
NCharCreate:string='Create Character';
NCharCreateEdit:string='Createand Edit Character';
NCharCancel:string='Cancel';

{Character Edit}
AccountName:string='Account: %s';
CharacterName:string='Character: %s';
Chartype:array[0..100] of TChartype;
PkLabel:array[0..100] of TPK;
StatusLabel:array[0..100] of TStatus;
Quests:array[0..100] of TQuests;
Maps:array[0..100] of string=('0-Lorencia','1-Dungeon','2-Devias','3-Noria','4-Lost Tower','5-Exile','6-Stadium','7-Atlans','8-Tarkan','9-Devil Square 1-4',
                              '10-Icarus','11-Blood Castle I','12-Blood Castle II','13-Blood Castle III','14-Blood Castle IV','15-Blood Castle V','16-Blood Castle VI','17-Blood Castle VII', '18-Chaos Castle I','19-Chaos Castle II',
                              '20-Chaos Castle III','21-Chaos Castle IV','22-Chaos Castle V','23-Chaos Castle VI','24-Kalima I','25-Kalima II','26-Kalima III','27-Kalima IV','28-Kalima V','29-Kalima VI',
                              '30-Castle Siege','31-Land of Trials','32-Devil Square 5-6','33-Aida','34-Cry Wolf','35-','36-Kalima VII','37-Kantru','38-Kantru','39-Kantru',
                              '40-','41-','42-','43-','44-','45-','46-','47-','48-','49-',
                              '50-','51-','52-','53-','54-','55-','56-','57-','58-','59-',
                              '60-','61-','62-','63-','64-','65-','66-','67-','68-','69-',
                              '70-','71-','72-','73-','74-','75-','76-','77-','78-','79-',
                              '80-','81-','82-','83-','84-','85-','86-','87-','88-','89-',
                              '90-','91-','92-','93-','94-','95-','96-','97-','98-','99-',
                              '100-');
{Character Errors}
CharacterErrorCaption:string='Error!';
CharacterError1:string='The Name field cannot be erased!';
CharacterError2:string='The Account field cannot be erased!';
CharacterError3:string='This account already has 5 characters!';
CharacterError4:string='The editor cannot change the character account!';
CharacterError5:string='This Character already exists!';
{Character Questions}
CharacterQuestion1:string='Are you sure you want to edit the character name?';
CharacterQuestion2:string='Are you sure you want to move the character to another account?';


{Item Texts}
{Excelent Options}
{Excelent Options WE}
ExcItemTypes:Array[1..6,1..6] of string;
NonExc:string='Without Excellent Options';
ItemNome:string='Item: %s';
ItemLevel:string='Level: +%s';
ItemOption:string='Option: z%s';
ItemDur:string='Duration: %s';
ItemSkill:string='Skill: %s';
ItemSkillOn:string='With Skill';
ItemSkillOff:string='Without Skill';
ItemLuck:string='Luck: %s';
ItemLuckOn:string='With Luck';
ItemLuckOff:string='Without Luck';
ItemAncient:string='Ancient: %s';
ItemExcellent:string='Excellent Options: %s';
ItemSerial:string='Serial: %s';
ItemInformation:string='Information';
InventoryTab:string='Inventory';
PSTab:string='PersonalStore';

{Ancient List}
AncientNormal:string='Without Ancient';
Ancient5:string='Ancient+5';
Ancient5Sta:string='Ancient+5+Stamina';
Ancient10:string='Ancient+10';
Ancient10Sta:string='Ancient+10+Stamina';
AncientConfig:string='Ancient';


{Skill Edit}
freeslot:string='Free Slot';
SkillSerial:string='Skill Serial: %s';
{Skill Errors}
SkillErrorCaption:string='Error!';
SkillError1:string='Unknow Skill';
SkillError2:string='Select an skill to add!';
SkillError3:string='The character already have this skill!%sThis character cannot have 2 skills = %sSelect a diferent skill to add!';
SkillError4:string='The editor cannot save the character skills!';
{Skill Question}
SkillQuestion1:string='Are you sure you want to change this skill?';
SkillQuestion2:string='Are you sure you want to delete this skill?';
SkillQuestion3:string='Are you sure you want to edit this chararcter Skills? ';
{Skill Confirm}
SkillConfirm1:string='The skills has been successfully added into the magiclist!';


{Favorite Form}
FavAccountHint:string='Account ID: %s '
                     +'%sPassword: %s '
                     +'%sName: %s '
                     +'%sSecret Question: %s '
                     +'%sSecret Answer: %s '
                     +'%sE-mail: %s '
                     +'%sPersonal ID: %s '
                     +'%s%s';
FavCharacterHint:string='Account ID: %s'
                     +'%sCharacter: %s'
                     +'%sClass: %s'
                     +'%sCtlCode: %s'
                     +'%sQuest: %s'
                     +'%sMoney: %s'
                     +'%sResets: %s'
                     +'%sLevel: %s'
                     +'%sExperience: %s'
                     +'%sLevelUpPoints: %s'
                     +'%sStrength: %s'
                     +'%sDexterity: %s'
                     +'%sVitality: %s'
                     +'%sEnergy: %s'
                     +'%sLeaderPoints: %s'
                     +'%sMap: %s'
                     +'%sPosX: %s'
                     +'%sPosY: %s'
                     +'%sPkLevel: %s'
                     +'%sPkCount %s'
                     +'%sPkTime: %s';
Blocked:string='Blocked Account';
UnBlocked:string='Unblocked Account';

{Fav Errors}
FavErrorCaption:string='Error!';
FavError1:string='Please select an Account!';
FavError2:string='Please select an Character!';




{Vault Editor}
ItemSize:string='Item Size:';
ItemAdd:string='Item Add';
VaultPos:string='Vault Position:';
ItemAddButton:string='Item Add';
Vault:string='Vault';
Info:string='Information:';
Back:string='Back';
VaultSave:string='Vault Save';
SeeQuery:string='See Query';
CopyQuery:string='Copy Query';
ClearVault:string='Clear';
ItemSelect:string='Item Select';
ItemType:string='Type:';
Item:string='Item:';
ItemNoLuck:string='Without Luck';
ItemAutoSerial:string='Auto Serial';
Pluslevel:string='+%s';
Plusoption:string='z%s';
infor:string='Informação';

{EquipList}
WeaponLeft:string='Weapon Left';
WeaponRight:string='Weapon Right';
Helm:string='Helm';
Armor:string='Armor';
Pants:string='Pants';
Gloves:string='Gloves';
Boots:string='Boots';
Wings:string='Wings';
Pet:string='Pet';
Pendants:string='Pendant';
RingLeft:string='Ring Left';
RingRight:string='Ring Right';


{Vault Errors}
VaultErrorCaption:string='Error!';
VaultError1:string='O Editor não consegue encontrar o arquivo CMT Data\MuItem.Mdb';
VaultError2:string='O Editor não consegue encontrar a Account %s';
VaultError3:string='O Editor não consegue encontrar o Character %s';
VaultError4:string='O Editor não consegue encontrar esse Warehouse';
VaultError5:string='Não foi possivel salvar este Warehouse';
VaultDelete:string='Você deseja deletar esse item?';
VaultQuestion1:string='Você deseja salvar o Warehouse';
VaultConfirm1:string='O Warehouse foi salvo com sucesso!';

{SqlNames.txt}
{MeMuonline}
{Memb_Info}
memb_info:string='MEMB_INFO';
memb_guid:string='memb_guid';
memb___id:string='memb___id';
memb__pwd:string='memb__pwd';
memb_name:string='memb_name';
sno__numb:string='sno__numb';
post_code:string='post_code';
addr_info:string='addr_info';
addr_deta:string='addr_deta';
tel__numb:string='tel__numb';
phon_numb:string='phon_numb';
mail_addr:string='mail_addr';
fpas_ques:string='fpas_ques';
fpas_answ:string='fpas_answ';
job__code:string='job__code';
appl_days:string='appl_days';
modi_days:string='modi_days';
out__days:string='out__days';
true_days:string='true_days';
mail_chek:string='mail_chek';
bloc_code:string='bloc_code';
ctl1_code:string='ctl1_code';

{VI_CURR_INFO}
VI_CURR_INFO:string='VI_CURR_INFO';
ends_days:string='ends_days';
chek_code:string='chek_code';
used_time:string='used_time';
memb___id2:string='memb___id';
memb_name2:string='memb_name';
memb_guid2:string='memb_guid';
sno__numb2:string='sno__numb';
Bill_Section:string='Bill_Section';
Bill_value:string='Bill_value';
Bill_Hour:string='Bill_Hour';
Surplus_Point:string='Surplus_Point';
Surplus_Minute:string='Surplus_Minute';
Increase_Days:string='Increase_Days';

{MEMB_STAT}
MEMB_STAT:string='MEMB_STAT';
memb___id3:string='memb___id';
ConnectStat:string='ConnectStat';
ServerName:string='ServerName';
IP:string='IP';
ConnectTM:string='ConnectTM';
DisConnectTM:string='DisConnectTM';

{MEMB_DETA}
MEMB_DETA:string='MEMB_DETA';
memb_guid3:string='memb_guid';
desc_text:string='desc_text';

{Muonline}
{AccountCharacter}
AccountCharacter:string='AccountCharacter';
Number:string='Number';
Id:string='Id';
GameID1:string='GameID1';
GameID2:string='GameID2';
GameID3:string='GameID3';
GameID4:string='GameID4';
GameID5:string='GameID5';
GameIDC:string='GameIDC';
MoveCnt:string='MoveCnt';

{Character}
Character:string='Character';
AccountID:string='AccountID';
CName:string='Name';
cLevel:string='cLevel';
LevelUpPoint:string='LevelUpPoint';
Classe:string='Class';
Experience:string='Experience';
Strength:string='Strength';
Dexterity:string='Dexterity';
Vitality:string='Vitality';
Energy:string='Energy';
Inventory:string='Inventory';
MagicList:string='MagicList';
Money:string='Money';
Life:string='Life';
MaxLife:string='MaxLife';
Mana:string='Mana';
MaxMana:string='MaxMana';
MapNumber:string='MapNumber';
MapPosX:string='MapPosX';
MapPosY:string='MapPosY';
MapDir:string='MapDir';
PkCount:string='PkCount';
PkLevel:string='PkLevel';
PkTime:string='PkTime';
MDate:string='MDate';
LDate:string='LDate';
CtlCode:string='CtlCode';
DbVersion:string='DbVersion';
Quest:string='Quest';
ChatLimitTime:string='ChatLimitTime';
shopitem:string='Inventory';
{GameServerInfo}
GameServerInfo:string='GameServerInfo';
Number2:string='Number';
ItemCount:string='ItemCount';
ZenCount:string='ZenCount';

{Guild}
Guild:string='Guild';
G_Name:string='G_Name';
G_Mark:string='G_Mark';
G_Score:string='G_Score';
G_Master:string='G_Master';
G_Count:string='G_Count';
G_Notice:string='G_Notice';
Number3:string='Number';
G_Type:string='G_Type';
G_Rival:string='G_Rival';
G_Union:string='G_Union';

{GuildMember}
GuildMember:string='GuildMember';
Name2:string='Name';
G_Name2:string='G_Name';
G_Level:string='G_Level';
G_Status:string='G_Status';

{MuCastle_DATA}
MuCastle_DATA:string='MuCastle_DATA';
MAP_SVR_GROUP:string='MAP_SVR_GROUP';
SIEGE_START_DATE:string='SIEGE_START_DATE';
SIEGE_END_DATE:string='SIEGE_END_DATE';
SIEGE_GUILDLIST_SETTED:string='SIEGE_GUILDLIST_SETTED';
SIEGE_ENDED:string='SIEGE_ENDED';
CASTLE_OCCUPY:string='CASTLE_OCCUPY';
OWNER_GUILD:string='OWNER_GUILD';
MONEY3:string='MONEY';
TAX_RATE_CHAOS:string='TAX_RATE_CHAOS';
TAX_RATE_STORE:string='TAX_RATE_STORE';
TAX_HUNT_ZONE:string='TAX_HUNT_ZONE';

{MuCastle_MONEY_STATISTICS}
MuCastle_MONEY_STATISTICS:string='MuCastle_MONEY_STATISTICS';
MAP_SVR_GROUP2:string='MAP_SVR_GROUP';
LOG_DATE:string='LOG_DATE';
MONEY_CHANGE:string='MONEY_CHANGE';

{MuCastle_NPC}
MuCastle_NPC:String='MuCastle_NPC';
MAP_SVR_GROUP3:string='MAP_SVR_GROUP';
NPC_NUMBER:string='NPC_NUMBER';
NPC_INDEX:string='NPC_INDEX';
NPC_DF_LEVEL:string='NPC_DF_LEVEL';
NPC_RG_LEVEL:string='NPC_RG_LEVEL';
NPC_MAXHP:string='NPC_MAXHP';
NPC_HP:string='NPC_HP';
NPC_X:string='NPC_X';
NPC_Y:string='NPC_Y';
NPC_DIR:string='NPC_DIR';
NPC_CREATEDATE:string='NPC_CREATEDATE';

{MuCastle_REG_SIEGE}
MuCastle_REG_SIEGE:string='MuCastle_REG_SIEGE';
MAP_SVR_GROUP4:String='MAP_SVR_GROUP';
REG_SIEGE_GUILD:string='REG_SIEGE_GUILD';
REG_MARKS:string='REG_MARKS';
IS_GIVEUP:string='IS_GIVEUP';
SEQ_NUM:string='SEQ_NUM';

{MuCastle_SIEGE_GUILDLIST}
MuCastle_SIEGE_GUILDLIST:string='MuCastle_SIEGE_GUILDLIST';
MAP_SVR_GROUP5:String='MAP_SVR_GROUP';
GUILD_NAME:string='GUILD_NAME';
GUILD_ID:string='GUILD_ID';
GUILD_INVOLVED:string='GUILD_INVOLVED';


{Warehouse}
warehouse:string='warehouse';
AccountID2:string='AccountID';
Items:string='Items';
Money2:string='Money';
EndUseDate:string='EndUseDate';
DbVersion2:string='DbVersion';
pw:string='pw';

{OptionData}
OptionData:string='OptionData';
Name3:string='Name';
SkillKey:string='SkillKey';
GameOption:string='GameOption';
QKey:string='QKey';
WKey:string='WKey';
EKey:string='EKey';
ChatWindow:string='ChatWindow';

{T_FriendMain}
T_FriendMain:string='T_FriendMain';
Guid:string='GUID';
Name4:string='Name';
FriendCount:string='FriendCount';
MemoCount:string='MemoCount';
MemoTotal:string='MemoTotal';

{T_FriendList}
T_FriendList:string='T_FriendList';
Guid2:string='GUID';
FriendGuid:string='FriendGuid';
FriendName:string='FriendName';
Del:string='Del';

{T_FriendMail}
T_FriendMail:string='T_FriendMail';
MemoIndex:string='MemoIndex';
Guid3:string='GUID';
FrindName:string='FrindName';
wDate:string='wDate';
Subject:string='Subject';
bRead:string='bRead';
Memo:string='Memo';
Photo:string='Photo';
Dir:string='Dir';
Act:string='Act';

{T_WaitFriend}
T_WaitFriend:string='T_WaitFriend';
Guid4:string='GUID';
FriendGuid2:string='FriendGuid';
FriendName2:string='FriendName';

{Store Procedure}
WZcreatecharacter:string='WZ_CreateCharacter';
implementation

{$R *.dfm}

function TGlobalConfig.bytetohex(src: byte): string;   {byte-->hex}
begin
  setlength(result, 2);
  asm
  mov edi, [result]
  mov edi, [edi]
  mov al, src
  mov ah, al
  shr al, 4 
  add al, '0'
  cmp al, '9'
  jbe @@outcharlo
  add al, 'a'-'9'-1
@@outcharlo:
  and ah, $f
  add ah, '0'
  cmp ah, '9'
  jbe @@outchar
  add ah, 'a'-'9'-1
@@outchar:
  stosw
  end;
  result:=uppercase(result);
end;

function TGlobalConfig.HexToInt(Hex : string) : Cardinal;   {Hex-->Integer}
const
  cHex = '0123456789ABCDEF';
var
   mult,i,loop : integer;
begin
  result := 0;
  mult := 1;
  for loop := length(Hex) downto 1 do
  begin
    i := pos(Hex[loop],cHex)-1;
    if (i < 0) then i := 0;
    inc(result,(i*mult));
    mult := mult * 16;
  end;
end;

procedure TGlobalConfig.ExcellentTypes;
begin
//1=WE
ExcItemTypes[1,1]:='Increases Mana After Monster +Mana/8';
ExcItemTypes[2,1]:='Increases Life After Monster +life/8';
ExcItemTypes[3,1]:='Increase Attacking(wizardry)speed+7';
ExcItemTypes[4,1]:='Increase Damage +2%';
ExcItemTypes[5,1]:='Increase Damage +level/20';
ExcItemTypes[6,1]:='Excellent Damage rate +10%';
{2=ANY}
ExcItemTypes[1,2]:='Non Excelent Option';
ExcItemTypes[2,2]:='Non Excelent Option';
ExcItemTypes[3,2]:='Non Excelent Option';
ExcItemTypes[4,2]:='Non Excelent Option';
ExcItemTypes[5,2]:='Non Excelent Option';
ExcItemTypes[6,2]:='Non Excelent Option';
{3=AR}
ExcItemTypes[1,3]:='Increases Zen After hunt +40%';
ExcItemTypes[2,3]:='Defense sucess rate +10%';
ExcItemTypes[3,3]:='Reflect Damage +5%';
ExcItemTypes[4,3]:='Damage decrease +4%';
ExcItemTypes[5,3]:='Increase Mana +4%';
ExcItemTypes[6,3]:='Increase HP +4%';
{4= FEN}
ExcItemTypes[1,4]:='Fenrir(Black)';
ExcItemTypes[2,4]:='Fenrir(Blue)';
ExcItemTypes[3,4]:='';
ExcItemTypes[4,4]:='';
ExcItemTypes[5,4]:='';
ExcItemTypes[6,4]:='';
{5=OR}
ExcItemTypes[1,5]:='Excelent Option 1';
ExcItemTypes[2,5]:='Excelent Option 2';
ExcItemTypes[3,5]:='Excelent Option 3';
ExcItemTypes[4,5]:='Excelent Option 4';
ExcItemTypes[5,5]:='Excelent Option 5';
ExcItemTypes[6,5]:='Excelent Option 6';
{6=WI}
ExcItemTypes[1,6]:='HP Increase';
ExcItemTypes[2,6]:='MP Increase';
ExcItemTypes[3,6]:='Ignore oponent defence power 3%';
ExcItemTypes[4,6]:='Max Stamina increase';
ExcItemTypes[5,6]:='Increase atack (wizardry) speed +5';
ExcItemTypes[6,6]:=ExcItemTypes[1,2];

end;

procedure TGlobalConfig.BasePK;
var I:Integer;
begin
  PkLabel[0].Num:=0;
  PkLabel[0].Nome:='Hero Level 2';

  PkLabel[1].Num:=1;
  PkLabel[1].Nome:='Hero Level 1';

  PkLabel[2].Num:=2;
  PkLabel[2].Nome:='Normal';

  PkLabel[3].Num:=3;
  PkLabel[3].Nome:='Pk Level 1';

  PkLabel[4].Num:=4;
  PkLabel[4].Nome:='Pk Level 2';

  PkLabel[5].Num:=5;
  PkLabel[5].Nome:='Murder';

  for I:=6 to 100 do
  begin
    PKLabel[i].Num:=-1;
    PKLabel[i].Nome:='';
  end;
end;

procedure TGlobalConfig.BaseStatus;
var I:integer;
begin
  StatusLabel[0].Num:=0;
  StatusLabel[0].Nome:='Normal';

  StatusLabel[1].Num:=1;
  StatusLabel[1].Nome:='Banned';

  StatusLabel[2].Num:=8;
  StatusLabel[2].Nome:='Game Master';

  for I:=3 to 100 do
  begin
    StatusLabel[i].Num:=-1;
    StatusLabel[i].Nome:='';
  end;
end;

procedure TGlobalConfig.BaseChartype;
var I:integer;
begin
  Chartype[0].Num:=0;
  Chartype[0].Nome:='Dark Wizard';
  Chartype[0].Inicial:=0;

  Chartype[1].Num:=1;
  Chartype[1].Nome:='Soul Master';
  Chartype[1].Inicial:=1;

  Chartype[2].Num:=16;
  Chartype[2].Nome:='Dark Knight';
  Chartype[2].Inicial:=0;

  Chartype[3].Num:=17;
  Chartype[3].Nome:='Blade Knight';
  Chartype[3].Inicial:=1;

  Chartype[4].Num:=32;
  Chartype[4].Nome:='Elf';
  Chartype[4].Inicial:=0;

  Chartype[5].Num:=33;
  Chartype[5].Nome:='Muse Elf';
  Chartype[5].Inicial:=1;

  Chartype[6].Num:=48;
  Chartype[6].Nome:='Magic Gladiator';
  Chartype[6].Inicial:=0;

  Chartype[7].Num:=64;
  Chartype[7].Nome:='Dark Lord';
  Chartype[7].Inicial:=0;

  for I:=8 to 100 do
  begin
    Chartype[i].Num:=-1;
    Chartype[i].Nome:='';
    Chartype[i].Inicial:=-1;
  end;
end;

procedure TGlobalConfig.arrayexp;
var i:integer;
begin
  setlength(levelexp,leveltotal-1);
  levelexp[0]:=0;
  levelexp[1]:=100;
  for i:=2 to leveltotal-1 do
    levelexp[i]:=2*levelexp[i-1]-levelexp[i-2]+((i+2)*60);

end;

procedure TGlobalConfig.ValueConfigIni(s: string);
var dsnini:tinifile;
begin
  //[MuOnline]
  dsnini:=tinifile.Create(extractfilepath(application.ExeName)+s);
  mudsn:=dsnini.ReadString('MuOnline','DSN','');
  muid:=dsnini.ReadString('MuOnline','User','');
  mupwd:=dsnini.ReadString('MuOnline','Password','');
  catalog:=dsnini.ReadString('MuOnline','DB','');
  //[Me_MuOnline]
  memudsn:=dsnini.ReadString('MeMuOnline','DSN','');
  memuid:=dsnini.ReadString('MeMuOnline','User','');
  memupwd:=dsnini.ReadString('MeMuOnline','Password','');
  mecatalog:=dsnini.ReadString('MeMuOnline','DB','');
  //[Others]
  vs:=dsnini.ReadString('Others','Version','');
  mastercatalog:=dsnini.ReadString('Others','MasterDB','');
  maxguilds:=strtoint(dsnini.ReadString('Others','MaxGuilds',''));
  FavoriteAccounts:=dsnini.ReadString('Others','FavoriteAccounts','')='1';
  FavoriteCharacters:=dsnini.ReadString('Others','FavoriteCharacters','')='1';
  FavoriteGuilds:= dsnini.ReadString('Others','FavoriteCharacters','')='1';
  if dsnini.ReadString('Others','UseViCurrInfo','')='1' then ViCurr:=true
    Else ViCurr:=False;
  //[Ecriptation]
  if dsnini.ReadString('Ecriptation','EncriptPasswords','')='1' then EncPass:=true
    else EncPass:=False;
  MSSQLBinnFolder:=dsnini.ReadString('Ecriptation','MSSQLBinnFolder','');
  NonEncriptedCollumn:=dsnini.ReadString('Ecriptation','NonEncriptedCollumn','');
  EncDll:=dsnini.ReadString('Ecriptation','EncriptationDLL','');
  Unique2Num:=dsnini.ReadString('ItemHexConfig','Unique2','');
  itemhexcount:=strtoint(dsnini.ReadString('ItemHexConfig','HexItemCount',''));
  //[LeaderPoint]
  LeadershipTable:=dsnini.ReadString('LeaderPoint','LeadershipTable','');
  LeaderShip:=dsnini.ReadString('LeaderPoint','LeaderShip','');
  LeadershipRef:=dsnini.ReadString('LeaderPoint','LeadershipRef','');
  //[Resets]
  ResetsTable:=dsnini.ReadString('Resets','ResetsTable','');
  Resets:=dsnini.ReadString('Resets','Resets','');
  ResetsRef:=dsnini.ReadString('Resets','ResetsRef','');
  //[MultiVault]
  MultiVaultTable:=dsnini.ReadString('MultiVault','MultiVaultTable','');
  MultiVaultMoney:=dsnini.ReadString('MultiVault','MultiVaultMoney','');
  MultiVaultId:=dsnini.ReadString('MultiVault','MultiVaultId','');
  MultiVaultItems:=dsnini.ReadString('MultiVault','MultiVaultItems','');
  MultiVaultNum:=dsnini.ReadString('MultiVault','MultiVaultNum','');
  MultiVaultTotal:=strtoint(dsnini.ReadString('MultiVault','MultiVaultTotal',''));
end;


procedure TGlobalConfig.LerMdb;
var i:integer;
begin
  with VarForm do
  begin
    if (fileexists(ExtractFilePath(Application.ExeName)+'\CMT Data\muitem.mdb')) then
    begin
      ItemQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ExtractFilePath(Application.ExeName)+'\CMT Data\muitem.mdb'+';Mode=ReadWrite;Persist Security Info=False';
      itemquery.SQL.Clear;
      itemquery.SQL.Add('select id2,unique2,name,type,x,y,wearto,setnumber,setitem,excoptiontype from item');
      itemquery.Open;
      Setlength(MdbInfo.MdbItems,itemquery.RecordCount-1);
      MdbInfo.QuantidadeDeItems:=itemquery.RecordCount-1;
      for i := 0 to MdbInfo.QuantidadeDeItems do
      begin

        MdbInfo.MdbItems[i].Index:=hextoint(itemquery.Fields[0].asstring);
        MdbInfo.MdbItems[i].Classe:=(itemquery.Fields[1].asinteger);
        MdbInfo.MdbItems[i].Nome:=itemquery.Fields[2].asstring;
        MdbInfo.MdbItems[i].Tipo:=itemquery.Fields[3].asstring;
        MdbInfo.MdbItems[i].X:=itemquery.Fields[4].asinteger;
        MdbInfo.MdbItems[i].Y:=itemquery.Fields[5].asinteger;
        MdbInfo.MdbItems[i].Wearto:=itemquery.Fields[6].asstring;
        MdbInfo.MdbItems[i].SetNumber:=itemquery.Fields[7].asinteger;
        MdbInfo.MdbItems[i].SetItem:=itemquery.Fields[8].asstring;
        MdbInfo.MdbItems[i].ExcOptionType:=itemquery.Fields[9].asstring;
        itemquery.Next;
      end;
      itemquery.Close;
    end else application.MessageBox(pchar(VaultError1),pchar(VaultErrorCaption),mb_ok+mb_iconwarning);
  end;
end;

procedure TGlobalConfig.BaseQuests;
var I:integer;
begin
  Quests[0].Code:='0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
  Quests[0].Nome:='None';

  Quests[1].Code:='0xFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
  Quests[1].Nome:='Find the "Scroll of Emperor"';

  Quests[2].Code:='0xFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
  Quests[2].Nome:='Three Treasures of Mu';
              
  Quests[3].Code:='0xEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
  Quests[3].Nome:='Gain Hero Status';

  Quests[4].Code:='0xAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
  Quests[4].Nome:='Secret Dark Stone (BK)';

  for I:=5 to 100 do
  begin
    Quests[i].Code:='';
    Quests[i].Nome:='';
  end;
end;

end.
