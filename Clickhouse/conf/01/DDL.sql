 CREATE TABLE dbo.acode
(
    `acode` String,
    `aname` String,
    `shortcode` String,
    `type` Int16,
    `dc` Int16,
    `vdclimit` Nullable(Int16),
    `property` Nullable(Int32),
    `fcode` String,
    `ymdeprecated` Nullable(Int32),
    `levl` Nullable(Int16),
    `codelevl` String,
    `flags` Nullable(Int16),
    `langname1` String,
    `langname2` String,
    `bank` String,
    `u_ccode` String,
    `n6_aname` String,
    `n6_acode` String,
    `u_fzhsx` String,
    `u_ncacode` String,
    `u_bs` String,
    `u_zbfz` String,
    `u_zblx` String,
    `u_zbzy` String,
    `mcode` String
)
ENGINE = MergeTree
ORDER BY acode
SETTINGS index_granularity = 8192;








CREATE TABLE bcode (
	bcode String,
	bname String,
	shortcode String,
	wcode String,
	ymdeprecated Int16,
	wcodex Int16,
	levl Int16,
	flags Int16,
	disablelogin Int16,
	gwcodes String,
	langname1 String,
	langname2 String,
	grpflags Int16,
	smfcode String,
	bnkcheckbcodes String,
	modifyer String,
	modifydate String,
	rptfcode String,
	ccode String,
	limbcodes String,
	limgwcode String,
	falen Int16,
	backtaxregno String,
	scode String,
	decisionbcode String,
	popedomflags Int16,
	vmsyscode String,
	vmacodesyscode String,
	usedflags Int16,
	srpucode String,
	chargesrpucodes String,
	feekind String,
	expflags Int16,
	matchup String,
	apportion Int16,
	nbsflags Int16,
	cgcodeflags Int16,
	subsidypost String,
	jcode String,
	bcodelevel Int16,
	bedate String,
	eddate String,
	contractid String,
	remark String,
	stcode String,
	itcode String,
	u_bcode String,
	u_fpbz String,
	srpucode2 String,
	teacherflag Int16,
	divrate String,
	u_bcode1 String,
	u_ncbcode String,
	tjcode String,
	IDCard String,
	refunder String,
	leader String
)
ENGINE = MergeTree
ORDER BY bcode
SETTINGS index_granularity = 8192



CREATE TABLE dbo.ccode
(
    `ccode` String,
    `cname` String,
    `shortcode` String,
    `fcodelist` String,
    `ymdeprecated` Nullable(Int32),
    `modifydate` Nullable(DateTime),
    `levl` Nullable(Int16),
    `langname1` String,
    `langname2` String,
    `usedbcodestr` String,
    `ecname` String,
    `flag` Nullable(Int32),
    `addr` String,
    `postcode` String,
    `contact` String,
    `telephone` String,
    `mobil` String,
    `fax` String,
    `email` String,
    `httpurl` String,
    `predate` Nullable(DateTime),
    `submitdate` Nullable(DateTime),
    `assessflags` Nullable(Int16),
    `submitdesc` String,
    `submittelephone` String,
    `submitwcode` String,
    `bank` String,
    `baccount` String,
    `creditvalue` Nullable(Decimal(16, 2)),
    `ncode` String,
    `udf_1` String,
    `udf_2` String,
    `udf_3` String,
    `udf_4` String,
    `udf_5` String,
    `udf_6` String,
    `udf_7` String,
    `udf_8` String,
    `udf_9` String,
    `remark` String,
    `artno` String,
    `artperson` String,
    `taxno` String,
    `allocdesc` String,
    `sendaddress` String,
    `partner` String,
    `status` String,
    `rpbank` String,
    `rpbankaccno` String,
    `ncodedesc` String,
    `wl_flags` Nullable(Int32),
    `range` String,
    `gwcodes` String,
    `password` String,
    `defbcode` String,
    `matchup` String,
    `sheetcode` String,
    `inbcode` String,
    `bcode` String,
    `concernedgcode` String,
    `ccodesource` String,
    `needdoc` String,
    `commendatorylevl` String,
    `markdesc` String,
    `inlandfee` Nullable(Float64),
    `sendsamples` Nullable(Int16),
    `ss_bcode` String,
    `ss_odate` Nullable(DateTime),
    `modifybcodes` String,
    `u_ncflags` Nullable(Int16) DEFAULT 0,
    `u_bcode` String,
    `submitbcode` String,
    `customerlevl` String,
    `supplylevl` String,
    `servelevl` String,
    `otherlevl` String,
    `setupdate` Nullable(DateTime),
    `registercapital` String,
    `stockdesc` String,
    `employeenum` Nullable(Int16),
    `branchorgnum` Nullable(Int16),
    `operatescope` String,
    `throughputunit` String,
    `comholsdatedesc` String,
    `checkfactorydoc` Nullable(String),
    `throughputqty` Nullable(Decimal(19, 0)),
    `isnewoldccode` String,
    `tickpecified` Nullable(Decimal(19, 4)),
    `assessdate` Nullable(DateTime),
    `throughputyear` Nullable(Int16),
    `affiliatedent` Nullable(Int16),
    `ccodetype` String,
    `ccodeassort` String,
    `eaddr` String,
    `advpayrated` Nullable(Decimal(19, 4)),
    `testid` String,
    `testquestionicode` String,
    `testtasktype` String,
    `teacherstudenttype` String,
    `testnumber` String,
    `curteacherbcode` String,
    `u_mgccode` Nullable(Int16),
    `u_artpersondate` Nullable(DateTime),
    `bidwebname` String,
    `bidccode` String,
    `bidcname` String,
    `ccodedesc` String,
    `nationality` String,
    `u_gzccode` String,
    `u_glzd` String,
    `ceshi` String,
    `u_glzd1` String,
    `olddate` Nullable(DateTime),
    `u_flags` Nullable(Int16),
    `taxnonew` String,
    `grade2015` String,
    `grade2014` String,
    `gnamedesc` String,
    `gsxz` String,
    `gbxz` String,
    `gdjg` String,
    `zbxz` String,
    `regcapital` Nullable(Float64),
    `nszt` String,
    `grade2016` String,
    `grade2017` String,
    `oldname` String,
    `jystatus` String,
    `u_ccode` String,
    `type` String,
    `yjrmb` Nullable(Float64),
    `u_mgccodebcode` String,
    `u_mgccodedate` Nullable(DateTime),
    `u_scjjd` String,
    `u_scswh` String,
    `u_sctype` String,
    `u_sczjtype` String,
    `u_scjyzxm` String,
    `u_scjyzno` String,
    `deprecatedreason` String,
    `province` String,
    `city` String,
    `area` String,
    `grade2018` String,
    `u_sccgno` String,
    `u_fjflags` Nullable(Int16),
    `fjtime` Nullable(DateTime),
    `fjwcode` String,
    `gsxzlt` Nullable(Int16),
    `fjremark` String,
    `newname` String,
    `deprebcode` String,
    `depredate` Nullable(DateTime),
    `qccupdate` Nullable(DateTime),
    `colorrank` Nullable(Int32),
    `color1` String,
    `color2` String,
    `colorreason` String,
    `qccremark` String,
    `colordate` Nullable(DateTime)
)
ENGINE = MergeTree
ORDER BY ccode
SETTINGS index_granularity = 8192


CREATE TABLE dbo.dcode
(
    `dcode` String,
    `dname` String,
    `ymdeprecated` Nullable(Int32),
    `shortcode` String,
    `levl` Nullable(Int16),
    `langname1` String,
    `langname2` String
)
ENGINE = MergeTree
ORDER BY dcode
SETTINGS index_granularity = 8192


CREATE TABLE ecode (
	`ecode` String,
	`ename` String,
	`ymdeprecated` Int16,
	`shortcode` String,
	`levl` Int16,
	`langname1` String,
	`langname2` String
)
ENGINE = MergeTree
ORDER BY ecode
SETTINGS index_granularity = 8192







CREATE TABLE dbo.fcode
(
    `fcode` String,
    `fname` String,
    `ymdeprecated` Nullable(Int32),
    `shortcode` String,
    `levl` Nullable(Int16),
    `langname1` String,
    `langname2` String,
    `fcodedesc` String,
    `zhbank_fname` String,
    `bgfname` String
)
ENGINE = MergeTree
ORDER BY fcode
SETTINGS index_granularity = 8192



CREATE TABLE hcode
(
    `hcode` String,
    `hname` String,
    `bcode` String,
    `ymdeprecated` Nullable(Int32),
    `levl` Nullable(Int16),
    `langname1` String,
    `langname2` String,
    `shortcode` String
)
ENGINE = MergeTree
ORDER BY hcode
SETTINGS index_granularity = 8192



CREATE TABLE dbo.hvoucher
(
    `id` String,
    `year` Int32,
    `month` Int16,
    `vtype` String,
    `vno` Int32,
    `bcode` String,
    `vdate` DateTime,
    `vappendix` Nullable(Int32),
    `vprepare` String,
    `vcheck0` String,
    `vcheck` String,
    `vkeeper` String,
    `gentype` Nullable(Int32),
    `vexpl` String,
    `rwflags` Nullable(Int32),
    `sheetcode` String,
    `innercode` String,
    `vmcode` String,
    `modifydate` Nullable(DateTime),
    `volumeno` Nullable(Int16),
    `vlock` String,
    `cashier` String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192


CREATE TABLE icode
(
    `icode` String,
    `iname` String,
    `ymdeprecated` Nullable(Int32),
    `levl` Nullable(Int16),
    `langname1` String,
    `langname2` String
)
ENGINE = MergeTree
ORDER BY icode
SETTINGS index_granularity = 8192



CREATE TABLE invoice (     `invicode` String,     `invcode` String,     `sheetcode` String,     `dc` Int16,     `jcode` String,     `odate` Nullable(DateTime),     `invkind` String,     `invflags` Nullable(Int16),     `initflags` Nullable(Int16),     `ccode` String,     `bcode` String,     `status` String,     `vprepare` String,     `predate` Nullable(DateTime),     `rdate` Nullable(DateTime),     `bcodearchive` String,     `ordtype` String,     `bomlevl` Nullable(Int16),     `costtype` String,     `rpno` String,     `paymode` String,     `fcypaied` Nullable(Float64),     `ibankrmb` Nullable(Float64),     `bankrmb` Nullable(Float64),     `bankfcy` Nullable(Float64),     `bankusd` Nullable(Float64),     `rpbank` String,     `payer` String,     `rpbankaddr` String,     `clientaddr` String,     `rpbankaccno` String,     `flags` Nullable(Int16),     `paycond` String,     `paymodedetail` String,     `noselfpay` Nullable(Int16),     `minvicodex` String,     `minvcodex` String,     `redflags` Nullable(Int16),     `redflags2` Nullable(Int16),     `fcode` String,     `rerate` Nullable(Decimal(17, 8)),     `uerate` Nullable(Decimal(17, 8)),     `fcy` Nullable(Float64),     `rmb` Nullable(Float64),     `usd` Nullable(Float64),     `costInt32ime` Nullable(Float64),     `rmbr` Nullable(Float64),     `rmbp` Nullable(Float64),     `rmbpr` Nullable(Float64),     `rmbpp` Nullable(Float64),     `basermb` Nullable(Float64),     `rmbo` Nullable(Float64),     `backicode` String,     `ordersheetcode` String,     `svicode` String,     `svcode` String,     `purinvicode` String,     `purinvcode` String,     `oinvicode` String,     `oinvcode` String,     `osheetcode` String,     `settlecodes` String,     `oinvicodex` String,     `oncredit` String,     `takedate` Nullable(DateTime),     `taxtype` String,     `ydzflags` Nullable(Int16),     `minvtype` String,     `oinvsid` String,     `wfperformdate` Nullable(DateTime),     `vid` String,     `vid2` String,     `ncode` String,     `ordicode` String,     `ordcode` String,     `islcode` String,     `slcode` String,     `autoredpremode` Nullable(Int16),     `remark` String,     `modifydate` Nullable(DateTime),     `gcodetype` String,     `acode` String,     `pcodelist` String,     `hcodelist` String,     `baseinvtypes` String,     `contcode` String,     `conticode` String,     `shipcodelist` String,     `paymenttype` String,     `picode` String,     `pcode` String,     `vappendix` Nullable(Int32),     `sharebcode` String,     `ccodetrust` String,     `salordicode` String,     `salordcode` String,     `salshipicode` String,     `salshipcode` String,     `adjtype` String,     `adjustmode` String,     `adjinvicode` String,     `adjinvcode` String,     `inbcode` String,     `checkinvcode` String,     `checkpay` String,     `checkno` String,     `checkrmb` Nullable(Float64),     `checkinvicode` String,     `checkbackodate` Nullable(DateTime),     `checkbank` String,     `checkodate` Nullable(DateTime),     `checkstatus` String,     `salinvicode` String,     `salinvcode` String,     `menudwid` String,     `mcopyflags` Nullable(Int16),     `affixnum` String,     `ccodearchive` String,     `reimtype` String,     `qcodelist` String,     `rushloan` String,     `checkapplyfcy` Nullable(Float64),     `checkapplyrmb` Nullable(Float64),     `checkapplyusd` Nullable(Float64),     `checkaffirmedflag` String,     `checkfinalreim` Nullable(Int16),     `bk_invtype` String,     `bk_bcodetype` String,     `checkissuefinish` String,     `checkissue` String,     `rpdate` Nullable(DateTime),     `advancemakeout` String,     `advsalordicode` String,     `advsalordcode` String,     `tradetype` String,     `trademode` String,     `busimode` String,     `busitype` String,     `inoutmode` String,     `priceterm` String,     `zerostock` String,     `affiliatedbusi` String,     `custominusd` Nullable(Float64),     `custinusd` Nullable(Float64),     `nocustinusd` Nullable(Float64),     `othercustinusd` Nullable(Float64),     `elsecustinusd` Nullable(Float64),     `consigninusd` Nullable(Float64),     `scopesecode` String,     `vocationcode` String,     `purinvcodelist` String,     `shipmode` String,     `shipmodedesc` String,     `origport` String,     `origportdesc` String,     `targport` String,     `targportdesc` String,     `shipdate` Nullable(DateTime),     `consigndate` Nullable(DateTime),     `ncodedesc` String,     `implcicode` String,     `implccode` String,     `openlcmode` String,     `makedate` Nullable(DateTime),     `lcfcy` Nullable(Float64),     `carryicode` String,     `carrycode` String,     `supplytype` String,     `feeacode` String,     `sendbusidate` Nullable(DateTime),     `ratifydate` Nullable(DateTime),     `ratifyresult` String,     `ratifyremark` String,     `busiaffirmdate` Nullable(DateTime),     `receivetype` String,     `accaffirmdate` Nullable(DateTime),     `resulttype` String,     `billaicode` String,     `billacode` String,     `ratifyflags` Nullable(Int16),     `agendapaydate` Nullable(DateTime),     `liccode` String,     `ifccode` String,     `usequota` String,     `offshorefccode` String,     `settleicodelist` String,     `settlecodelist` String,     `settlecode` String,     `resultdate` Nullable(DateTime),     `govpur` String,     `importtype` String,     `ccodecommisionh` String,     `ratecommisionb` Nullable(Decimal(17, 8)),     `ratecommisionh` Nullable(Decimal(17, 8)),     `fcycommisionb` Nullable(Float64),     `usdcommisionb` Nullable(Float64),     `rmbcommisionb` Nullable(Float64),     `fcycommisionh` Nullable(Float64),     `usdcommisionh` Nullable(Float64),     `rmbcommisionh` Nullable(Float64),     `agrmode` String,     `agrmb` Nullable(Float64),     `agusd` Nullable(Float64),     `agfcy` Nullable(Float64),     `agqtycount` Nullable(Decimal(16, 4)),     `agrate` Nullable(Decimal(19, 8)),     `agfcode` String,     `agrerate` Nullable(Decimal(17, 8)),     `aguerate` Nullable(Decimal(17, 8)),     `agflags` String,     `lStringfeermb` Nullable(Float64),     `agefeemode` String,     `profitrmb` Nullable(Float64),     `needdoc` String,     `needdoc2` String,     `aginvicode` String,     `aginvcode` String,     `expensermb` Nullable(Float64),     `insuremodfcy` Nullable(Decimal(17, 8)),     `insureratefcy` Nullable(Decimal(17, 8)),     `insuremod` Nullable(Decimal(17, 8)),     `insurerate` Nullable(Decimal(17, 8)),     `freightusd` Nullable(Float64),     `freightrmb` Nullable(Float64),     `freightfcy` Nullable(Float64),     `insureusd` Nullable(Float64),     `insurermb` Nullable(Float64),     `insurefcy` Nullable(Float64),     `thegoodsbcode` String,     `finallyccode` String,     `finallycncode` String,     `gcodedesc` String,     `hscode` String,     `schedulename` String,     `bankfeeassume` String,     `thirdflags` Nullable(Int16),     `paygoodssettle` String,     `capitalicode` String,     `capitalcode` String,     `settletype` String,     `pdopermb` Nullable(Float64),     `settlermb` Nullable(Float64),     `qtydesc` String,     `hcodedesc` String,     `icodedesc` String,     `shipname` String,     `bolcode` String,     `ifcsiwdicode` String,     `ifcsiwdcode` String,     `ifcsicode` String,     `ifcsinum` String,     `otherrmb` Nullable(Float64),     `netrecfcy` Nullable(Float64),     `netrecrmb` Nullable(Float64),     `netrecusd` Nullable(Float64),     `rmborder` Nullable(Float64),     `usdorder` Nullable(Float64),     `fcyorder` Nullable(Float64),     `useexpcoustom` String,     `expcustomcode` String,     `ccodedesc` String,     `tblremark` String,     `fundsource` String,     `payflags` Nullable(Int16),     `impclicode` String,     `impclcode` String,     `passdate` Nullable(DateTime),     `settlemode` String,     `datasource` String,     `secflags` Nullable(Int16),     `agetozyflags` Nullable(Int16),     `lowuerate` Nullable(Decimal(17, 8)),     `conpaydate` Nullable(DateTime),     `settleinvicode` String,     `settleinvcode` String,     `salinvrmb` Nullable(Float64),     `settleflags` Nullable(Int16),     `settlebyccodetrust` String,     `pcicode` String,     `pccode` String,     `settledebitrmb` Nullable(Float64),     `settlecreditrmb` Nullable(Float64),     `fundtype` String,     `ccodename` String,     `invificode` String,     `invifcode` String,     `advancefeefcy` Nullable(Float64),     `tacklefeefcy` Nullable(Float64),     `batchcode` String,     `loosedate` Nullable(DateTime),     `forarrivedate` Nullable(DateTime),     `expcustomdate` Nullable(DateTime),     `checkflags` Nullable(Int16),     `smchargermb` Nullable(Float64),     `confcode` String,     `confcy` Nullable(Float64),     `conusd` Nullable(Float64),     `conrmb` Nullable(Float64),     `indfcode` String,     `indfcy` Nullable(Float64),     `indusd` Nullable(Float64),     `indrmb` Nullable(Float64),     `ccmflags` Nullable(Int16),     `sheettype` String,     `potype` String,     `drawer` String,     `pobank` String,     `podate` Nullable(DateTime),     `gatcompany` String,     `llendorser` String,     `byendorser` String,     `accdate` Nullable(DateTime),     `attermdate` Nullable(DateTime),     `postatus` String,     `discdate` Nullable(DateTime),     `accbank` String,     `discrate` Nullable(Decimal(19, 10)),     `discaccrualrmb` Nullable(Float64),     `discrmb` Nullable(Float64),     `workwcode` String,     `factaccdate` Nullable(DateTime),     `bsbcode` String,     `bsdate` Nullable(DateTime),     `expuptaxdate` Nullable(DateTime),     `hxmatchdate` Nullable(DateTime),     `hxmatchwcode` String,     `hxcheckdate` Nullable(DateTime),     `hxcheckwcode` String,     `confirmcheckflags` Nullable(Int16),     `hxcanceldate` Nullable(DateTime),     `hxcancelwcode` String,     `hxstatus` String,     `invlist` String,     `adjustacode` String,     `cabinetcount` Nullable(Int16),     `spotcheckdate` Nullable(DateTime),     `consignmentdate` Nullable(DateTime),     `settlementdate` Nullable(DateTime),     `betakeccode` String,     `cocrddate` Nullable(DateTime),     `shipinformcode` String,     `inshipinformdate` Nullable(DateTime),     `shipinformdate` Nullable(DateTime),     `ftmrpicode` String,     `ftmrpcode` String,     `gcode` String,     `gattr1` String,     `gattr2` String,     `gattr3` String,     `gattr4` String,     `gattr5` String,     `gattr6` String,     `gattr7` String,     `gattr8` String,     `gattr9` String,     `cgicode` String,     `cgcode` String,     `gcodetypedesc` String,     `ordidx` Nullable(Int16),     `ccodeproduce` String,     `confpriceicode` String,     `confpricecode` String,     `productpurtype` String,     `qtp` Nullable(Decimal(18, 6)) DEFAULT 0,     `qtpunit` String,     `qtyrate` Nullable(Decimal(17, 8)) DEFAULT 0,     `qty` Nullable(Decimal(18, 6)) DEFAULT 0,     `qtyunit` String,     `ordsheetcode` String,     `upric` Nullable(Decimal(19, 6)),     `upric_p` Nullable(Decimal(19, 6)),     `ccfcy` Nullable(Float64),     `stosetfcy` Nullable(Float64),     `overfcy` Nullable(Float64),     `ordupric_p` Nullable(Decimal(19, 6)),     `invdesctype` String,     `unpayinvcode` String,     `msinvicode` String,     `msinvcode` String,     `cashflags` Nullable(Int16),     `cashfcy` Nullable(Float64),     `bankcardflags` Nullable(Int16),     `bankcardfcy` Nullable(Float64),     `imprestflags` Nullable(Int16),     `imprestfcy` Nullable(Float64),     `cusrecovery` Nullable(DateTime),     `sheetcodex` String,     `recsalshipicode` String,     `recsalshipcode` String,     `recinvicode` String,     `recinvcode` String,     `rec_termdate` Nullable(DateTime),     `rec_operater` String,     `rec_operatedate` Nullable(DateTime),     `rec_confirmcheckflags` Nullable(Int16),     `extrachargeflags` Nullable(Int16),     `advpicode` String,     `advpcode` String,     `exchangegolflags` Nullable(Int16),     `taxno` String,     `paydesc` String,     `salshipicodex` String,     `salshipcodex` String,     `yearbacktax` Nullable(Int16),     `monthbacktax` Nullable(Int16),     `shbacktax` Nullable(Float64),     `blcbacktax` Nullable(Float64),     `batchbacktax` String,     `bsalinv` String,     `bfeesinit` String,     `invicodecc` String,     `bsalinvmode` String,     `recinfodate` Nullable(DateTime),     `productremark` String,     `taxsource` String,     `preindate` Nullable(DateTime),     `documentdate` Nullable(DateTime),     `shipask` String,     `lackdocument` Nullable(String),     `lackproinfor` String,     `confirmation` String,     `recname` String,     `reccontact` String,     `rectelephone` String,     `recaddr` String,     `delname` String,     `deltelephone` String,     `deladdr` String,     `notifier` String,     `voy` String,     `cid` String,     `sealid` String,     `ctype` String,     `frename` String,     `frecontact` String,     `fretelephone` String,     `freaddr` String,     `shiptodate` Nullable(DateTime),     `exchangedate` Nullable(DateTime),     `exchangefcy` Nullable(Float64),     `exchangevid` String,     `exchangestamp` String,     `boxmark` String,     `packageinfo` String,     `grossweight` Nullable(Decimal(19, 6)),     `netweight` Nullable(Decimal(19, 6)),     `qtx` Nullable(Decimal(18, 6)),     `transvehicles` String,     `originplaceno` String,     `defectiveinfo` String,     `bcleared` String,     `cosettleicode` String,     `cosettlecode` String,     `baddebtstype` String,     `appcustport` String,     `custportccode` String,     `gnamedesc` String,     `taxconfirmdate` Nullable(DateTime),     `preveristatus` Nullable(Int32),     `veridate` Nullable(DateTime),     `billsenddate` Nullable(DateTime),     `advsettleofpay` String,     `consignclient` String,     `transferdate` Nullable(DateTime),     `Int32erestfcy` Nullable(Float64),     `Int32erestrmb` Nullable(Float64),     `Int32erestusd` Nullable(Float64),     `ibankfcy` Nullable(Float64),     `ibankusd` Nullable(Float64),     `issettled` String,     `blistrerate` Nullable(Decimal(17, 8)),     `blistuerate` Nullable(Decimal(17, 8)),     `bsettlererate` Nullable(Decimal(17, 8)),     `bsettleuerate` Nullable(Decimal(17, 8)),     `bsettlermb` Nullable(Decimal(17, 8)),     `underccode` String,     `noteInt32erestrmb` Nullable(Float64),     `coldate` Nullable(DateTime),     `difibankrmb` Nullable(Decimal(17, 8)),     `paidflags` Nullable(Int16),     `financingtype` String,     `plexdate` Nullable(DateTime),     `paydate` Nullable(DateTime),     `agmode` String,     `iscorporation` String,     `agcalcrmb` Nullable(Float64),     `rmbperusd` Nullable(Float64),     `agmodedesc` String,     `agebailrate` Nullable(Decimal(17, 8)),     `agebailremark` String,     `invsrctype` String,     `pursheetcode` String,     `transcom` String,     `carlicense` String,     `usemode` String,     `yshscode` String,     `truckcode` String,     `rerateaccount` String,     `gsumvolumn` Nullable(Decimal(18, 6)) DEFAULT 0,     `containerqtp` Nullable(Decimal(18, 6)) DEFAULT 0,     `u_usdrate` Nullable(Decimal(20, 8)),     `agendatype` String,     `redrecordflags` Nullable(Int16),     `upcavcopyicode` String,     `upcavcopysheetcode` String,     `acodeforibank` String,     `cdate` Nullable(DateTime),     `issharebcode` Nullable(Int16),     `inflags` Nullable(Int16),     `advtype` String,     `truetype` String,     `rushfcy` Nullable(Float64),     `rushrmb` Nullable(Float64),     `rushusd` Nullable(Float64),     `reimpayfcy` Nullable(Float64),     `reimpayrmb` Nullable(Float64),     `reimpayusd` Nullable(Float64),     `submitdate10` Nullable(DateTime),     `gentype` String,     `chargewipeicode` String,     `chargewipecode` String,     `invtypelist` String,     `budgetmode` String,     `expensesbcode` String,     `originalchargewipeicode` String,     `originalchargewipecode` String,     `chargewipename` String,     `egresspeople` String,     `egresspeoplenum` String,     `destInt32port` String,     `feeodatefrom` Nullable(DateTime),     `feeodateto` Nullable(DateTime),     `feeodatenum` String,     `chargewipecodelist` String,     `book_payto` String,     `costusetype` String,     `cashierwcode` String,     `chargewipebcode` String,     `approvaltype` String,     `chargewipebcode2` String,     `originalbcode2` String,     `learntype` String,     `originalbcode` String,     `performwcode` String,     `sheetmodifyflags` Nullable(Int16),     `financingicode` String,     `financingsheetcode` String,     `splittype` String,     `splitfcy` Nullable(Decimal(19, 6)),     `splitrmb` Nullable(Decimal(19, 6)),     `splitusd` Nullable(Decimal(19, 6)),     `adjustinvoice` Nullable(Int16),     `indenfynum` String,     `produceyear` Nullable(Int32),     `producemonth` Nullable(Int32),     `humanrmb` Nullable(Float64),     `makefeermb` Nullable(Float64),     `swift` String,     `acccouicode` String,     `acccoucode` String,     `settcheckicode` String,     `settcheckcode` String,     `bfeinvicode` String,     `testid` String,     `testquestionicode` String,     `testtasktype` String,     `teacherstudenttype` String,     `testnumber` String,     `curteacherbcode` String,     `bidicode` String,     `outtercode` String,     `bidcodelist` String,     `ccname` String,     `u_lv` Nullable(Decimal(19, 6)),     `peday` Nullable(Int16),     `u_ghdw` String,     `u_taxno` String,     `u_addr` String,     `u_rpbankaccno` String,     `u_yfusd` Nullable(Float64),     `u_kfusd` Nullable(Float64),     `u_rpbank` String,     `u_type` String,     `reccashtype` String,     `biddinglist` String,     `bidpackagelist` String,     `bidcode` String,     `turntype` String,     `bprepayinv` String,     `btechimpinv` String,     `bremotepay` String,     `freforward` String,     `deliverydate` Nullable(DateTime),     `stockindate` Nullable(DateTime),     `stockoutdate` Nullable(DateTime),     `insurdate` Nullable(DateTime),     `stockdate` Nullable(DateTime),     `gsumweight` Nullable(Decimal(19, 4)),     `forwardcomp` String,     `forwarddate` Nullable(DateTime),     `shipport` String,     `surecomp` String,     `suredate` Nullable(DateTime),     `surefcy` Nullable(Float64),     `surefinishdatef` Nullable(DateTime),     `surefinishdatet` Nullable(DateTime),     `bcheckdoc` String,     `bopendoc` String,     `arrivedate` Nullable(DateTime),     `cuspassdate` Nullable(DateTime),     `cusinspection` String,     `taxrecovery` Nullable(DateTime),     `u_poss` Nullable(Int16),     `u_invtype` String,     `u_hhcb` Nullable(Decimal(32, 6)),     `u_recivtype` String,     `u_fklx` String,     `u_bl` Nullable(Decimal(32, 8)),     `u_hkxz` String,     `u_lirun` Nullable(Decimal(32, 4)),     `u_rexrate` Nullable(Decimal(32, 8)),     `u_month` String,     `u_uexrate` Nullable(Decimal(32, 8)),     `lockedflag` Nullable(Int16),     `expdocicode` String,     `indtype` String,     `payfcode` String,     `payfcy` Nullable(Float64),     `udx` String,     `u_fpsh` String,     `u_lsh` String,     `usdrate` Nullable(Decimal(19, 6)),     `dclbz` Nullable(Int16),     `dfbz` Nullable(Int16),     `u_shbcode` String,     `u_shdate` Nullable(DateTime),     `u_flags` String,     `name` String,     `yjccode` String,     `yjsjh` String,     `u_fplsh` String,     `u_cwspdate` Nullable(DateTime),     `u_rzbs` String,     `u_rzdate` Nullable(DateTime),     `u_jsccode` String,     `sklx` String,     `cddate` Nullable(DateTime),     `cmid` String,     `yhdate` Nullable(DateTime),     `sfyf` String,     `eta` Nullable(DateTime),     `shsbhm` String,     `u_remark` String,     `reporticode` String,     `reportcode` String,     `newccode` String,     `fhdicode` String,     `fhdcode` String,     `salcode` String,     `salicode` String,     `u_reaflags` Nullable(Int16),     `exchangegol` Nullable(Float64),     `ddsk` Nullable(Decimal(32, 4)),     `tc_hxbz` String,     `xuha` String,     `hgbzj` Nullable(Int16),     `jckrq` Nullable(DateTime),     `yjreadflags` String,     `jyfy` String,     `sdflag` Nullable(Int16),     `copies` String,     `gsvid` String,     `transid` String,     `draftday` String,     `pobankname` String,     `attachdoc` String ) ENGINE = MergeTree ORDER BY invicode SETTINGS index_granularity = 8192


CREATE TABLE invoiceg (     `invicode` String,     `idx` Int16,     `invgid` String,     `invtype` String,     `mdc` Nullable(Int16),     `dc` Int16,     `invgidred` String,     `invsid` String,     `invgidx` String,     `payflags` String,     `exesmode` String,     `gentype` String,     `vdc` Nullable(Int16),     `paymode` String,     `itemtype` String,     `odate` Nullable(DateTime),     `tdc` Nullable(Int16),     `costflags` Nullable(Int16),     `datatype` String,     `gcode` String,     `gattr1` String,     `gattr2` String,     `gattr3` String,     `gattr4` String,     `gattr5` String,     `gattr6` String,     `gattr7` String,     `gattr8` String,     `gattr9` String,     `qtp` Nullable(Decimal(18, 6)) DEFAULT 0,     `qtpunit` String,     `qtyrate` Nullable(Decimal(18, 6)) DEFAULT 0,     `qty` Nullable(Decimal(18, 6)) DEFAULT 0,     `qtyunit` String,     `qtx` Nullable(Decimal(18, 6)),     `qtxunit` String,     `fcode` String,     `rerate` Nullable(Decimal(17, 8)),     `uerate` Nullable(Decimal(17, 8)),     `upric` Nullable(Decimal(19, 6)),     `costupric` Nullable(Decimal(19, 6)),     `fcy` Nullable(Float64),     `rmb` Nullable(Float64),     `usd` Nullable(Float64),     `costrmb` Nullable(Float64),     `addtaxrate` Nullable(Decimal(8, 5)),     `addtax` Nullable(Float64),     `backtaxrate` Nullable(Decimal(8, 5)),     `backtax` Nullable(Float64),     `upric_p` Nullable(Decimal(19, 6)),     `settlermb` Nullable(Float64),     `salshipicodex` String,     `salshipcodex` String,     `qtxrate` Nullable(Decimal(18, 6)) DEFAULT 0,     `systemgen` Nullable(Int16),     `salshipgid` String,     `paysheetcode` String,     `payinnercode` String,     `sortidx` Nullable(Int16),     `ordicode` String,     `ordcode` String,     `salordicode` String,     `salordcode` String,     `salshipicode` String,     `salshipcode` String,     `invicodex` String,     `invcodex` String,     `purinvicode` String,     `purinvcode` String,     `islcode` String,     `slcode` String,     `implcicode` String,     `implccode` String,     `bankquotaicode` String,     `picode` String,     `pcode` String,     `jcode` String,     `settleinvicode` String,     `ccode` String,     `vid` String,     `fccxcode` String,     `confirmflag` Nullable(Int16),     `recinvdate` Nullable(DateTime),     `prefccxcode` String,     `efccode` String,     `salinvicode` String,     `salinvcode` String,     `conttype` String,     `remark` String,     `upicode` String,     `upidx` Nullable(Int16),     `upsheetcode` String,     `copyflags` Nullable(Int16),     `contcode` String,     `conticode` String,     `invrerate` Nullable(Decimal(17, 8)),     `invuerate` Nullable(Decimal(17, 8)),     `settlerate` Nullable(Decimal(12, 6)),     `redtype` String,     `cgicodepur` String,     `cgcodepur` String,     `cgicode` String,     `cgcode` String,     `cgicodesal` String,     `cgcodesal` String,     `backinvtype` String,     `backinvicode` String,     `backinvcode` String,     `backinvicodex` String,     `backinvcodex` String,     `preinvicode` String,     `preinvcode` String,     `pprid` String,     `htouttercode` String,     `backinvgid` String,     `basebyinvicode` String,     `basebyinvgid` String,     `prebffcy` Nullable(Float64),     `prebfrmb` Nullable(Float64),     `prebfusd` Nullable(Float64),     `ufcy` Nullable(Float64),     `uuerate` Nullable(Decimal(17, 8)),     `uueratex` Nullable(Decimal(17, 8)),     `fcodex` String,     `payfcode` String,     `payuerate` Nullable(Decimal(17, 8)),     `payfcy` Nullable(Float64),     `agepaytype` String,     `outnotifyicode` String,     `outnotifyidx` Nullable(Int16),     `modifydate` Nullable(DateTime),     `gmodifydate` Nullable(DateTime),     `modifier` String,     `bcode` String,     `bankaccount` String,     `vprepare` String,     `ccodetrust` String,     `preinvicodex` String,     `prererate` Nullable(Decimal(17, 8)),     `preuerate` Nullable(Decimal(17, 8)),     `prefcy` Nullable(Float64),     `prermb` Nullable(Float64),     `preusd` Nullable(Float64),     `prefcode` String,     `boppicode` String,     `bopptcode` String,     `feeodatefrom` Nullable(DateTime),     `feeodateto` Nullable(DateTime),     `startport` String,     `destInt32port` String,     `areaid` String,     `milekind` String,     `traffictools` String,     `alldays` Nullable(Decimal(20, 0)),     `subsidiesdouble` Nullable(Float64),     `reimdouble` Nullable(Float64),     `chargewipeicode` String,     `chargewipecode` String,     `feekind` String,     `budgetmode` String,     `srpbudicode` String,     `checkinvicode` String,     `checkinvcode` String,     `ldc` Nullable(Int16),     `srpbudicode2` String,     `checkinvgid` String,     `qcode` String,     `checkapplyfcy` Nullable(Float64),     `checkapplyrmb` Nullable(Float64),     `checkapplyusd` Nullable(Float64),     `checkfinalreim` Nullable(Int16) DEFAULT 0,     `checksameflag` Nullable(Int32) DEFAULT 0,     `checktype` String,     `payeebname` String,     `payeebankname` String,     `payeebankaccount` String,     `paysdays1` Nullable(Decimal(19, 6)) DEFAULT 0,     `paysdays2` Nullable(Decimal(19, 6)) DEFAULT 0,     `bcodelevel` Nullable(Int16) DEFAULT 0,     `advancemakeout` String,     `purcostupric` Nullable(Decimal(19, 6)),     `purcostrmb` Nullable(Float64),     `puraddtaxrate` Nullable(Decimal(8, 5)),     `puraddtax` Nullable(Float64),     `purrmb` Nullable(Float64),     `purupric_p` Nullable(Decimal(19, 6)),     `acode` String,     `tradetype` String,     `trademode` String,     `busimode` String,     `busitype` String,     `ccodecor` String,     `extendccode` String,     `customupric` Nullable(Decimal(19, 6)),     `customfcy` Nullable(Float64),     `customusd` Nullable(Float64),     `customrmb` Nullable(Float64),     `keyflags` Nullable(Int16),     `ratecommisionb` Nullable(Decimal(17, 8)),     `fcycommisionb` Nullable(Float64),     `usdcommisionb` Nullable(Float64),     `rmbcommisionb` Nullable(Float64),     `fcyorder` Nullable(Float64),     `usdorder` Nullable(Float64),     `rmborder` Nullable(Float64),     `upricorder` Nullable(Decimal(18, 6)),     `upric_porder` Nullable(Decimal(18, 6)),     `groupidx` String,     `hscode` String,     `customtaxrate` Nullable(Float64),     `customtax` Nullable(Float64),     `impaddtaxrate` Nullable(Float64),     `impaddtax` Nullable(Float64),     `excisetaxrate` Nullable(Float64),     `excisetax` Nullable(Float64),     `cfrfcy` Nullable(Float64),     `cfrusd` Nullable(Float64),     `cfrrmb` Nullable(Float64),     `fobfcy` Nullable(Float64),     `fobusd` Nullable(Float64),     `fobrmb` Nullable(Float64),     `ratecommisionh` Nullable(Decimal(17, 8)),     `ccodecommisionh` String,     `fcycommisionh` Nullable(Float64),     `usdcommisionh` Nullable(Float64),     `rmbcommisionh` Nullable(Float64),     `agrmb` Nullable(Float64),     `agusd` Nullable(Float64),     `agfcy` Nullable(Float64),     `agrate` Nullable(Decimal(19, 8)),     `spicode` String,     `spcode` String,     `schedulecode` String,     `schedulename` String,     `applyicode` String,     `applycode` String,     `gnamedesc` String,     `gnamedesc2` String,     `cspecdesc` String,     `especdesc` String,     `othergattr1` String,     `othergattr2` String,     `othergattr3` String,     `othergattr4` String,     `othergattr5` String,     `cgcodedesc1` String,     `cgcodedesc2` String,     `cgcodedesc3` String,     `cgcodedesc4` String,     `cgcodedesc5` String,     `longconticode` String,     `longcontcode` String,     `shortconticode` String,     `shortcontcode` String,     `cfcy` Nullable(Float64),     `cusd` Nullable(Float64),     `crmb` Nullable(Float64),     `insfcy` Nullable(Float64),     `insusd` Nullable(Float64),     `insrmb` Nullable(Float64),     `overseafeeusd` Nullable(Float64),     `overseafeermb` Nullable(Float64),     `freightusdupric` Nullable(Decimal(19, 6)),     `insureusdupric` Nullable(Decimal(19, 6)),     `expensermb` Nullable(Float64),     `expenseupric` Nullable(Decimal(19, 6)),     `capitalicode` String,     `capitalcode` String,     `puytype` String,     `puyitem` String,     `capitalicodex` String,     `finallyccode` String,     `finallycncode` String,     `thegoodsbcode` String,     `planflags` Nullable(Int16),     `costtype` String,     `modelno` String,     `inflag` Nullable(Int16),     `indate` Nullable(DateTime),     `eta` Nullable(DateTime),     `inprepare` String,     `invsettleid` String,     `recpaied` Nullable(Int16),     `qualitysample` String,     `flags` Nullable(Int16),     `fcoder` String,     `fcyr` Nullable(Float64),     `lcfcyorder` Nullable(Float64),     `lcfcy` Nullable(Float64),     `gcodetypedesc` String,     `sampletype` String,     `proplanicode` String,     `proplancode` String,     `bpsheetcode` String,     `bpicode` String,     `bpcode` String,     `bpccode` String,     `pomicode` String,     `pomcode` String,     `applicode` String,     `applcode` String,     `plexicode` String,     `plexcode` String,     `cdpayflag` Nullable(Int16),     `pcicode` String,     `pccode` String,     `poinvicode` String,     `poinvcode` String,     `outoinvgidred` String,     `explcicode` String,     `explccode` String,     `saladdtaxrate` Nullable(Decimal(6, 4)),     `saladdtax` Nullable(Float64),     `busiconfirmflag` Nullable(Int16),     `feetype` String,     `feeodate` Nullable(DateTime),     `waterlot` String,     `liteight` String,     `fpayment` String,     `futuresbzupric` Nullable(Decimal(17, 8)),     `futuresbzrmb` Nullable(Float64),     `futuresbzcostrmb` Nullable(Float64),     `futuresbzaddtax` Nullable(Float64),     `futurespcupric` Nullable(Decimal(17, 8)),     `futurespcrmb` Nullable(Float64),     `futurespccostrmb` Nullable(Float64),     `futurespcaddtax` Nullable(Float64),     `pbfinality` String,     `rsicode` String,     `rscode` String,     `oldhcode` String,     `baseicodexx` String,     `basecodexx` String,     `sheetcodexx` String,     `invgidxx` String,     `invgidxxx` String,     `setccinvicode` String,     `invgidxxred` String,     `baseicodex` String,     `basecodex` String,     `dcx` Nullable(Int16),     `sheetcodex` String,     `cctype` String,     `ccflags` Nullable(Int16),     `proordicode` String,     `proordcode` String,     `ccdate` Nullable(DateTime),     `batchcode` String,     `origconsigndate` Nullable(DateTime),     `batchlatedays` Nullable(Int16),     `beforeinvcode` String,     `ftmrpicode` String,     `ftmrpcode` String,     `prosalordicode` String,     `prosalordcode` String,     `propicode` String,     `propcode` String,     `invdesctype` String,     `fundtype` String,     `advancecheckdate` Nullable(DateTime),     `advancecheckvprepare` String,     `advancecheckpredate` Nullable(DateTime),     `advancecheckflags` Nullable(Int16),     `bcredit` String,     `tickcode` String,     `creditdate` Nullable(DateTime),     `findate` Nullable(DateTime),     `tickdays` Nullable(Int16),     `invifcode` String,     `invificode` String,     `expclicode` String,     `stockingid` String,     `slcodex` String,     `overrunmattype` String,     `ifccodeg` String,     `hxcheckdateg` Nullable(DateTime),     `impclcodeg` String,     `confirmcheckflags` Nullable(Int16),     `settletype` String,     `srctype` String,     `extrachargeflags` Nullable(Int16),     `extrasalshipicode` String,     `extrasalshipcode` String,     `slist` String,     `clist` String,     `bcslist` Nullable(Int16),     `invtypex` String,     `ccodename` String,     `exchangegolflags` Nullable(Int16),     `divdate` Nullable(DateTime),     `recetype` String,     `shbacktax` Nullable(Float64),     `blcbacktax` Nullable(Float64),     `selectbacktax` String,     `bsalinv` String,     `actredvou` String,     `salinvseticode` String,     `vid2` String,     `agetozyflags` Nullable(Int16),     `settleicode` String,     `settlecode` String,     `impclicode` String,     `trueimpclcode` String,     `innercode` String,     `sheetcode` String,     `factpayflags` Nullable(Int16),     `year` Nullable(Int16),     `month` Nullable(Int16),     `vdate` Nullable(DateTime),     `vno` Nullable(Int32),     `vtype` String,     `settlererate` Nullable(Decimal(17, 8)),     `cosettleicode` String,     `cosettlecode` String,     `cosettleitemid` String,     `accountrmb` Nullable(Float64),     `finalinvicode` String,     `finalinvcode` String,     `pdc` Nullable(Int16),     `advsalshipcode` String,     `scode` String,     `settleuerate` Nullable(Decimal(17, 8)),     `settleusd` Nullable(Float64),     `accountrerate` Nullable(Decimal(17, 8)),     `accountuerate` Nullable(Decimal(17, 8)),     `accountusd` Nullable(Float64),     `blistrerate` Nullable(Decimal(17, 8)),     `blistuerate` Nullable(Decimal(17, 8)),     `bsettlererate` Nullable(Decimal(17, 8)),     `bsettleuerate` Nullable(Decimal(17, 8)),     `invoicetypex1` String,     `invoicetypex2` String,     `tnetqty` Nullable(Decimal(19, 6)),     `itemidx` Nullable(Int16),     `addvid1` String,     `addvid2` String,     `addvid3` String,     `fcy_ct` Nullable(Float64),     `rmb_ct` Nullable(Float64),     `usd_ct` Nullable(Float64),     `qty_ct` Nullable(Decimal(18, 6)) DEFAULT 0,     `upric_ct` Nullable(Decimal(19, 6)),     `fcycommisionb_ct` Nullable(Float64),     `usdcommisionb_ct` Nullable(Float64),     `rmbcommisionb_ct` Nullable(Float64),     `fcycommisionh_ct` Nullable(Float64),     `usdcommisionh_ct` Nullable(Float64),     `rmbcommisionh_ct` Nullable(Float64),     `customupric_ct` Nullable(Decimal(19, 6)),     `customusd_ct` Nullable(Float64),     `customfcy_ct` Nullable(Float64),     `customrmb_ct` Nullable(Float64),     `cfcy_ct` Nullable(Float64),     `cusd_ct` Nullable(Float64),     `crmb_ct` Nullable(Float64),     `insfcy_ct` Nullable(Float64),     `insusd_ct` Nullable(Float64),     `insrmb_ct` Nullable(Float64),     `qtp_ct` Nullable(Decimal(18, 6)) DEFAULT 0,     `qtyrate_ct` Nullable(Decimal(17, 8)) DEFAULT 0,     `upric_p_ct` Nullable(Decimal(19, 6)),     `freightusdupric_ct` Nullable(Decimal(19, 6)),     `insureusdupric_ct` Nullable(Decimal(19, 6)),     `rmborder_ct` Nullable(Float64),     `usdorder_ct` Nullable(Float64),     `fcyorder_ct` Nullable(Float64),     `upric_porder_ct` Nullable(Decimal(18, 6)),     `upricorder_ct` Nullable(Decimal(18, 6)),     `firstpayfcy` Nullable(Float64),     `srcftmrpicode` String,     `srcftmrpcode` String,     `u_usdrate` Nullable(Float64),     `cdate` Nullable(DateTime),     `billtype` String,     `qtx2` Nullable(Decimal(18, 6)),     `qtx2unit` String,     `qtx2rate` Nullable(Decimal(18, 6)),     `grossweight` Nullable(Decimal(19, 6)),     `netweight` Nullable(Decimal(19, 6)),     `invtype2` String,     `checkaffirmedflag` String,     `trafficfcy` Nullable(Float64),     `stayfcy` Nullable(Float64),     `bjtrafficfcy` Nullable(Float64),     `otherfcy` Nullable(Float64),     `mealfillfcy` Nullable(Float64),     `jtbtfcy` Nullable(Float64),     `ztbtfcy` Nullable(Float64),     `learntype` String,     `bk_bcodetype` String,     `originalchargewipeicode` String,     `originalchargewipecode` String,     `chargewipename` String,     `book_payto` String,     `expensesbcode` String,     `costfcy` Nullable(Float64),     `incometaxfcy` Nullable(Float64),     `quitloadinvsid` String,     `qicode` String,     `advflags` Nullable(Int16),     `advcode` String,     `advinvicodex` String,     `advinvcodex` String,     `advdc` Nullable(Int16),     `splitdc` Nullable(Int16),     `splitinvgid` String,     `bkrebuildpro` String,     `replenishflags` String,     `addtaxcode` String,     `indenfynum` String,     `zkdate` Nullable(DateTime),     `cgcodedesc6` String,     `burdentype` String,     `payfortype` String,     `ccdicode` String,     `prebudgetvid` String,     `prebudgefinally` String,     `exprebateicode` String,     `exprebatecode` String,     `cgcodedesc7` String,     `cgcodedesc8` String,     `cgcodedesc9` String,     `assignflags` Nullable(Int16),     `assigncostupric` Nullable(Float64),     `assigncostrmb` Nullable(Float64),     `issinglebfe` Nullable(Int16),     `bfeicode` String,     `cgcodedesc10` String,     `cgcodedesc11` String,     `cgcodedesc12` String,     `cgcodedesc13` String,     `cgcodedesc14` String,     `cgcodedesc15` String,     `btricode` String,     `btrcode` String,     `bidpackagecode` String,     `bidicode` String,     `bidcode` String,     `outtercode` String,     `feeicode` String,     `feecode` String,     `ccname` String,     `selltache` String,     `bidsalelink` String,     `contact` String,     `telephone` String,     `makecname` String,     `makencode` String,     `tenderver` String,     `bidinvoiceicodex` String,     `bidinvoicecode` String,     `bmail` String,     `invcname` String,     `fcydesc` String,     `bailfinishdate` Nullable(DateTime),     `inlgicode` String,     `inlgcode` String,     `bffective` Nullable(Int16),     `expertlibcode` String,     `expertname` String,     `idcode` String,     `taxfcy` Nullable(Float64),     `totalfcy` Nullable(Float64),     `boppcode` String,     `biddingicode` String,     `biddingcode` String,     `bidpackageicodelist` String,     `bidpackagecodelist` String,     `bidbailss` Nullable(Float64),     `bidbidys` Nullable(Float64),     `bidbidss` Nullable(Float64),     `bidbailback` Nullable(Float64),     `bidcanback` Nullable(Float64),     `eticode` String,     `taxrmb` Nullable(Float64),     `bidccode` String,     `taxdc` Nullable(Int16),     `taxinvicode` String,     `taxinvcode` String,     `bidcname` String,     `ncode` String,     `refundaccount` String,     `bailinvcname` String,     `bidinformicode` String,     `bidinformcode` String,     `bidpackageicode` String,     `bgdhcode` String,     `u_hhcb` Nullable(Decimal(32, 6)),     `implcreqcode` String,     `u_invtypex` String,     `u_invtype` String,     `bgdicode` String,     `u_gcode` String,     `bgdqtp` Nullable(Decimal(32, 4)),     `bgdfcy` Nullable(Float64),     `bghl` Nullable(Decimal(32, 4)),     `u_lr` Nullable(Decimal(32, 4)),     `u_oldqtp` Nullable(Decimal(32, 4)),     `bankfcy` Nullable(Float64),     `ibankfcy` Nullable(Float64),     `bankusd` Nullable(Float64),     `ibankusd` Nullable(Float64),     `u_tkkh` String,     `u_ktrmb` Nullable(Float64),     `cmid` String,     `dkidx` Nullable(Int16),     `dkicode` String,     `sklx` String,     `cmicode` String,     `cmcode` String,     `bs` String,     `bsdate` Nullable(DateTime),     `fhdicode` String,     `fhdcode` String,     `salcode` String,     `salicode` String,     `exchangegol` Nullable(Float64),     `bgfcy` Nullable(Decimal(19, 2)),     `fkfcmy` Nullable(Decimal(19, 2)),     `costrmb1` Nullable(Decimal(19, 2)),     `addtax1` Nullable(Decimal(19, 2)),     `bhsje` Nullable(Decimal(19, 2)),     `zzse` Nullable(Decimal(19, 2)),     `fhcode` String,     `fhicode` Nullable(Decimal(19, 4)),     `bgfcode` String,     `fkfcrmb` Nullable(Decimal(19, 2)),     `dzfph` String,     `priceterm` String,     `sfzz` String,     `finished` Nullable(Int16),     `tgcode` String,     `kpqk` String,     `tse` Nullable(Decimal(19, 2)),     `xyscode` String,     `wkpfcy` Nullable(Decimal(19, 2)) ) ENGINE = MergeTree ORDER BY (invicode, idx, invgid) SETTINGS index_granularity = 8192


CREATE TABLE snsoft_wzgmnew.dbo.ivoucher (
	`hid` String,
	`ino` Int16,
	`year` Int16,
	`month` Int16,
	`vtype` String,
	`vno` Int16,
	`vdate` String,
	`expl` String,
	`vdc` Int16,
	`acode` String,
	`bcode` String ,
	`ccode` String ,
	`dcode` String ,
	`ecode` String ,
	`fcode` String ,
	`gcode` String ,
	`hcode` String ,
	`icode` String ,
	`jcode` String ,
	`ncode` String ,
	`qcode` String,
	`rcode` String ,
	`scode` String ,
	`xcode` String ,
	`pcode` String ,
	`rmb` Float64 ,
	`fcy` Float64 ,
	`usd` Float64 ,
	`qty` Decimal(18,6) ,
	`qtx` Decimal(18,6) ,
	`rerate` Decimal(20,10) ,
	`uerate` Decimal(20,10) ,
	`upric` Decimal(18,6) ,
	`qtyunit` String,
	`taxrate` Decimal(6,2) ,
	`odate` String ,
	`rdate` String ,
	`kept` Int16,
	`bankmonth` Int16 ,
	`bankid` Int16 ,
	`rcy` Float64 ,
	`rpterate` Decimal(20,10) ,
	`vtypeno` String ,
	`rpid` String ,
	`id` String,
	`gattr1` String ,
	`gattr2` String ,
	`gattr3` String ,
	`gattr4` String ,
	`gattr5` String ,
	`gattr6` String ,
	`gattr7` String ,
	`gattr8` String ,
	`gattr9` String ,
	`innercode` String ,
	`cacode` String ,
	`cashier` String ,
	`sheetcode` String ,
	`oldvtype` String ,
	`oldvno` Int16 ,
	`cashmonth` Int16 ,
	`cashid` Int16 ,
	`kcode` String ,
	`lcode` String ,
	`mcode` String ,
	`ocode` String ,
	`wcode` String ,
	`ucode` String ,
	`vcode` String ,
	`ycode` String ,
	`tsl` Float64 ,
	`remark` String ,
	`usdrate` Decimal(20,10) ,
	`dfkm` String 
)ENGINE = MergeTree
ORDER BY hid
SETTINGS index_granularity = 8192