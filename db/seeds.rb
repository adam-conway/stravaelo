# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.fir


UserTournament.destroy_all
TournamentSegment.destroy_all
UserSegment.destroy_all
User.destroy_all
Tournament.destroy_all
Segment.destroy_all

tournament = Tournament.create!(name: "Bay Area Icons", created_at: "2018-06-11 01:04:46", updated_at: "2018-06-11 01:04:46")

segment1 = Segment.create!(id: 1470688, name: "Northgate to Summit from Castle Rock", distance: 19862.9, average_grade: 5.4, maximum_grade: 17.0, elevation_high: 1120.0, elevation_low: 38.4, total_elevation_gain: 1090.6, athlete_attempts: 17904, unique_athletes: 6303, created_at: "2018-06-03 16:24:39", updated_at: "2018-06-06 03:18:24", kom_time: 3156, polyline: 'q~kfF`ntgVCuABgAj@kCLaA?aFEy@@{@Cm@JwECkA?yCEoBDaBBkELaBZoATq@z@}Ap@o@nAu@fD_BfAe@zA]JGtAUfAYd@Ep@B|DbAb@DPAt@Kr@UpBqAbB{@tEoC|@c@bAYl@GrBGxABfAMl@Qj@Yd@[n@Uj@k@dAs@`@UfBw@\\WXc@zCqHv@sB|BsEfAmCn@e@Z@RJ`AfA`@^`@NVFX?~A[hA}@Za@d@[TGl@ChBJlAi@`@e@dAyArA}A\\w@Ne@Ra@\\e@Z]\\WTGhAOZQDGRq@d@{Cp@aBvCyDjCcDr@mA~@aAtAsAjA}@rAs@nAYbAg@JKdAeBpBiBp@e@nAc@XW~@sA`C}E|@_Br@}@|@o@V[t@gARUZw@j@cAJ]Jk@DiBASI_@w@eBQgAA[L]PAPFb@Z^BPKJ]@OMsCD]NSTOXKVE\\MNIXYJQDUAWM{@Em@JiAAcDBk@HSLOPEr@B\\INOLg@NiE?c@EY[}A?YHWRIXDv@PH?\\GPGVUHSBYAe@S}@?[FURKjBFRINSNs@Jq@@u@E_A@IHQPK`@EVMpAeA`@mAf@qBl@_BPWVQJC`B[d@CXJFT?HCT_@l@GTCVD^FPFLPRLHVHfBDl@ZrAh@TBXA^UVW^q@^}CRcAt@mAl@_A\\aANOHEh@IXMLQHUDYLmAAk@Ks@C]BUDQRa@Nq@HQLMXINKHQBWCWKo@AU?eBLy@Xw@J_@Ak@M{@@_@Hs@?a@CYU{@Ue@g@u@o@k@Oe@A]F]TSl@UP_AUqAC_@ImB[mAu@}@KYAOB_@P[TM^ONMBW@u@Gc@Y{@@MHGNBXXv@b@^hALVPTZRTVP`@t@Zd@JR?RCPKz@o@VY~@aBL]HcAL[NId@I|@FPKFSEg@]u@MO_@]S[Cg@@MJYPOZSR]JmAH_@Zg@JKREj@?XEf@WTQZe@d@i@dBqAf@[T[Ls@LWLEj@?XC\\K^_@d@}@Z]NIf@OPSBQIk@{@mB[M_@NWX_@Ri@TOBQAMK}@cBOOOEMBKLIPMnAQ^SXo@d@q@l@ULa@D_ABc@F[EKM?UP_@`@c@bAu@X]Ne@Ho@GgA@e@Fe@XaAXuBBc@AKGUQMS?KBQJ_@p@QPUHy@BWMGS@WRwA?_BKa@SEUNIHWl@m@\\MRATJp@ANGPWVi@Xc@\\_@l@w@hBkA~Ak@l@OFQBQAIO@UDGd@]PQVk@^sA\\qEAg@I_ADe@b@_BRkAB_AFo@?eADYFYr@oAl@aBJa@HqADSb@y@h@o@L]H]JONIF@nATz@@vAI~ASt@AFAVOLQLk@BmBXcAFa@Bo@AWWcBL]\\U`@i@Vu@Lo@N_@HKJEbA[NODQDe@JSPGF@x@HVLXDF?PKN[DS@o@Ps@P]h@o@^E\\?XBNHJLXj@TV|@h@VJZFj@F`@EVGTIPONY@S?SI[kAiCUe@Y[s@_@QWI]AS@SDUL[LQdA{@RYBWIUKI]Mu@GGCKW?_@PsA?UE_@?]Ji@ZeADW?s@Ki@EIMGOBYLONKNg@hAWZqBdAMHg@z@]\\WBUO]g@k@k@GEw@[GEEIESHq@Je@Pa@d@c@PYFSBW@oAHuA?cAAWK_@KOQIk@Fc@Z[Za@p@{BfCUTOFWHcBPq@d@QHQ?WEY@u@h@o@ZSFM@YA{@WMAWDWJYPUR_@`@UNSFi@Bm@UQ?QB]XKXCPIpBBRXbAATMJWEUQSUe@y@YeAk@gA_@_@]a@_@YYOU?WLET@jAGVa@z@WvA_@dACj@Dn@Ot@k@b@Y\\_@Xa@JKHKTDl@Vj@BN@NKV]TWZ]f@]RqBZ[Ay@Q[@OPKVGZG`AKb@KRQJI@SKKWE_@B]H[f@w@VeALYRWPQl@Kj@Eb@?t@GLIH]AUQgAGk@Z_DC[Ia@IWo@yAAO@IHOLIVEZUHQLi@Fa@AQMo@Yc@SSYQqAi@USKc@Dc@Pi@f@u@Lc@BQAg@AQ_@kAMs@@w@XkDAc@G[Uc@c@a@a@Oc@U[Wg@w@c@yAQYKIa@Me@U]_@MYK[GaAG]_@aASu@OS_@Is@Fm@C]KIKOaAC_@MiANqA@u@ASGa@Ka@_AgBQg@Cm@T{AC]UMOBKNG`@EpB@t@JdBR~AAf@WzB?r@Pr@@ZG\\Yz@Nr@Vn@PNt@VfAd@HHFJJ\\B\\Aj@@HEb@GVQRq@Tk@XYHw@Dw@LQHQLOPYr@MTQNU@YSGa@C}BHgBCy@K_@IE[MGEKSEW?g@F}AHc@LWX[R]FWBW@s@EgAKqAScAUg@YuAOa@Yc@Se@IW')

segment2 = Segment.create!(id: 5816161, name: "Tunnel Road", distance: 4965.8, average_grade: 4.7, maximum_grade: 10.8, elevation_high: 435.1, elevation_low: 202.0, total_elevation_gain: 0.0, athlete_attempts: 251095, unique_athletes: 12294, created_at: "2018-06-03 16:24:48", updated_at: "2018-06-06 03:18:24", kom_time: 613, polyline: "is_fFzi_iVLcAH{A?a@Ii@[i@m@U[g@Ge@a@u@m@Mi@Lu@~@c@DM_@Co@Ge@Mq@_@c@IA_ACi@HoB|Ae@HO[QcBc@w@k@IoBp@u@\\Y@I_@F_@Xw@FaAUqBOe@m@k@UEcB@g@Ts@l@o@Zm@`@e@J]Io@He@l@e@JYUg@w@MQq@Y]B]F]WCs@Om@e@UmA[g@My@K_@WCm@RYzA}@`@o@J_AIc@@a@XE\\Bf@^NNj@N^_@Xm@f@]RD`Ab@j@ET]b@yAD[EoAEc@Ne@h@?nANb@OF_@AKQkBMo@Ho@ZGVNn@@DIFa@E_AWu@Go@BWCs@O_AF_BVg@v@Oh@]t@uAn@o@~@sAZU~@Ob@JLHX^^t@j@xC|@nBd@\\^QF]K{BA}@JgAVsAf@eAX[n@KZH\\NXFj@AlAc@d@g@@i@EUi@kAYsAM_ABw@ZYn@If@c@z@cCb@k@Lk@Ka@_@MgBAi@WK[E]F_AH]J{@?cATo@XMXINILMNa@?[Gi@SkADaALkABm@M_AU{@Du@\\WbA[rA_AfAe@t@e@hCiEp@a@~@c@")

segment3 = Segment.create!(id: 316833, name: "Pinehurst from Canyon Rd.", distance: 6343.44, average_grade: 3.4, maximum_grade: 75.0, elevation_high: 367.6, elevation_low: 151.4, total_elevation_gain: 0.0, athlete_attempts: 122818, unique_athletes: 12062, created_at: "2018-06-03 16:25:22", updated_at: "2018-06-06 03:18:25", kom_time: 777, polyline: "cmyeFnwohV]hAg@~ByAbE[bBOnA[|AUx@Wh@kApBKVY~@Qx@m@vBi@fAeAjBMl@UbCOd@]p@qDvE_@t@{@zBeAxBaCzC{AxBk@dAU|@QbCUpAQ`@e@bAa@pAk@fAGFIXm@`AkAlASXw@fA_AjBq@z@{@r@cE`Ey@f@u@Z[Rc@^_@b@_@N?HWCUJUNoAlAwAnBIRi@|@yAfBk@h@s@~@}@dBo@t@g@v@wChFo@x@mApAeBjC{BvCmAzA]h@]x@{@tCqBdI]dA_AnDqArF}@pCiAhCyAnC_@`@_Al@QRKVI^Gr@Y|BK|BMv@Kh@w@zBg@~@ETB`@F?RINQb@u@Vg@x@wBPYp@o@RqAl@oALc@Fe@Bi@H]\\a@j@g@RIj@OTOP[VuAHOLKVGN?HB~@z@~@l@JPFRTpANb@VXRLFBPGJMH]Fw@F]FSLKTCXDTHl@b@NDL@PEJE^c@HGj@GPGLODM@QCQMUMO{BiAuAeAGMFEH@t@b@t@^tA`@v@h@n@XTPXZP^DT?VIVMJQFgAPQJKNCR@Z^hB?REPMPQFsAFRAa@FKHEJAHJr@@PCNGNGHc@VML_AdBSh@EX?V")

segment4 = Segment.create!(id: 618015, name: "El Toyonal/Lomas Contadas", distance: 4705.68, average_grade: 8.0, maximum_grade: 36.2, elevation_high: 502.7, elevation_low: 124.1, total_elevation_gain: 394.899, athlete_attempts: 3133, unique_athletes: 843, created_at: "2018-06-03 23:06:12", updated_at: "2018-06-06 03:22:09", kom_time: 895, polyline: "_rffFn}xhV@HGRWXwAn@s@d@]NwBzAOPITGZ@PDRPb@b@r@FDRBP?ZEpAGhAQd@Of@_@p@WH?LDHJFT?f@EPMX_@d@WR_@TYTOT]v@MNYr@CXBp@Pt@P`@b@f@LTPr@L`A^n@^h@Nf@G\\K`BMr@M~AMVi@d@GJa@TMRIn@AhA@h@Np@Hr@HRJLVPL@VIr@o@x@_APMbAmA`A{@t@e@RQh@w@j@sA\\i@PKH@HBHN@RYjBI\\C\\[vAC`@M\\g@\\]^YpAGp@BZDN^p@XVr@\\LLR\\J^?LO~@Nb@Vj@?PEHAHML_Ax@Kb@?LRdABZ?NITOfA@n@AJJb@Zh@?PH^ALELa@b@GJId@Hb@Bl@FX?XA@g@[i@USCQ?o@Fi@He@@UFiAn@_A\\KJOZ]vAKx@UrCMl@CR]~@U\\ANFJZFVAb@MRCh@BLAFID[^eANYNQRMNERM|@Yh@W`@OPM|@QH?PF?Js@|@GPCJEr@@V@RN\\NLTF`@Br@Il@?p@JTPrAnBX\\HBXBj@CLHZf@Rb@f@r@Zj@PHT?x@Hx@VHFRFPLHRB\\UfAe@vAcAbCI\\APB\\Rj@PXr@x@~@r@dAl@l@VRVBXIn@m@zBa@lACPCd@")

segment5 = Segment.create!(id: 749803, name: "South Park Drive Gate to Gate", distance: 2261.84, average_grade: 9.0, maximum_grade: 18.3, elevation_high: 471.6, elevation_low: 268.8, total_elevation_gain: 202.8, athlete_attempts: 21577, unique_athletes: 3891, created_at: "2018-06-03 23:06:18", updated_at: "2018-06-06 03:22:09", kom_time: 434, polyline: "g{gfFfmbiV^K`@_@PIVk@|@_BZc@x@{@lAkBHQVw@Va@@SCwCA]ESA[JmAReANkBB_@EgA?Wt@oCN_@Ra@^i@l@mAz@s@\\Q^i@^YXe@d@i@x@q@z@}@LQl@i@R[LOp@kA`@}@n@i@hAoANa@LSTi@?]Pw@Dg@A{@@q@DW\\oAfA_C`@a@^ORQ^MRQPG`@GLCJAf@Nh@FLAPGVQJQLi@Bu@Ni@LQ|@aAjAo@t@cAj@Yn@KhAKb@M~@e@p@Yh@Gh@P`@j@VRZLb@B")

segment6 = Segment.create!(id: 2685055, name: "Wildcat Canyon SPDR to Spruce", distance: 9408.58, average_grade: 1.2, maximum_grade: 12.3, elevation_high: 272.8, elevation_low: 95.0, total_elevation_gain: 191.4, athlete_attempts: 60612, unique_athletes: 7334, created_at: "2018-06-03 23:06:24", updated_at: "2018-06-06 03:22:10", kom_time: 992, polyline: "ogifFrq|hVCRSl@Ex@Ib@@\\Cl@{@hACLARBVLf@P^\\h@Tj@PfA?NILIBYDWEWDKHMTI^Cb@?t@JfCBNVd@LJJDxBVNDJLJVHl@DNf@f@^Xz@dBNTVRTL`@LJJDLELm@Nu@b@oAj@_@Jw@DKHGNGr@?d@LhA\\vBBTEn@Mp@Ol@?`@BTJ`@JP\\XJBR?p@[L?JB`@\\HLHd@ARGRo@`AIVUfAWbB?PGr@s@rBYd@u@t@oAbBk@~AER?RFh@Cj@Hn@FLLVHZLXv@`A|@d@VXz@~ART\\PRj@Wx@q@p@]z@[fAK|@@j@Dj@Bp@EfAe@fBa@v@Yt@EvA@pBA^Q`Ai@fBS\\}@p@k@XQTM\\G\\IfB]dAi@r@Id@Kt@DvDKn@Cx@G^]t@w@v@yA|@SVSVu@dBmBrA}@j@[PuAf@oCrAKJe@jAVbDPfA^bAzAvBxCrDhBbD`C`Dj@hAl@`AbAnBrBrE^b@f@Tp@Yv@o@h@YpA_AJWMe@]{CByA`@iANOfBIf@[pAqApA{APMz@g@x@UZy@?q@IeAToAp@iAV}@x@c@RAdC_@hA}@z@_AxCkDTOzAa@TCl@Lz@`AX`AH\\XvB^rBAnAMr@QZUT_Av@S^OpAMv@Cz@@fBn@|CB`CCzAVpBd@|@?p@YXw@i@[\\yArC_@b@Ap@Tl@t@dAF~AWhAo@v@QBs@Sk@u@kAQqAPYPw@v@k@\\mAlAKTAXCp@Dx@YlBFr@Zf@XJLXCr@Wb@m@d@kCh@sADqAFiAq@{@Om@d@eAXmBt@KLIl@l@zAdAdBd@tAAp@e@v@wBtAa@d@GXZxAd@`AHX]bAw@d@}@FyB?SD{Ap@CxBYlA[l@mAr@eDrAkAfAc@f@MXG\\@bAG\\aBjCQ~BA~AGzABzA`@p@j@fATv@@`AC`@[lAEZ")

segment7 = Segment.create!(id: 4648538, name: "The Three Bears - Bottom of Mama to Top of Baby", distance: 10818.7, average_grade: -0.3, maximum_grade: 11.9, elevation_high: 288.2, elevation_low: 104.4, total_elevation_gain: 264.4, athlete_attempts: 48026, unique_athletes: 9974, created_at: "2018-06-03 23:06:30", updated_at: "2018-06-06 03:22:10", kom_time: 993, polyline: "corfFriwhVNMPKj@Mv@IbA?rCXfC\\rCXn@J~@FvBZzBP|@Jn@BxDd@t@DrAPdGn@`AAl@IZIn@Yv@k@d@i@`@q@j@qAT_AHkBGyC@}BIcDHc@DuAReALa@h@mAp@aATUjAw@^Ox@i@pBaA\\Sj@g@v@iAJWZqAL_Af@oEFc@VeA`@aAd@u@tDyD`@g@Zk@\\eA^yAv@sChAiEj@oCRaBJiB@q@CsA]{De@}DGq@Aw@HyAD_@R{@Zy@^w@zA}BhCkDj@k@n@c@p@]t@WnAUpHu@jAKlAEt@BjANhAVl@PfAl@rD`CxAt@j@TfBj@hBv@^RrAhAf@n@`@p@b@dAVbAZjB~@hE^dC|AfHd@rCb@rB\\fCJbAP`E?lBKjDWdCA~AI~@EnAIvASbEKfAUtEQfBEp@StBQrFWtDa@|HSdC]lCkAhGmArFU~@g@nEU~EKjAEz@Gh@Oz@e@`BaA`BYr@eBjCe@xAM`ACb@@d@PdBPt@Pf@\\p@Zb@b@`@j@X^Lb@FxBLxANj@Rh@Zz@x@b@j@fCpFdAjBf@j@VTp@`@v@Xv@H\\@xEI~B?^@^D^Jz@^l\\dSv@j@ZXn@|@d@fAXnAJtA@l@GtAmAdKMtAAxAHvATrAPd@h@fAX^ZZZV^T`@P`@HbAL^A^C|@Qt@]n@e@v@{@xAuBjAuBlBqCpAeBjAmAr@i@XOjC}@lA[j@An@BbAPd@RX^Jb@?b@KbAFnA^`AXn@^dBTp@")

Segment.all.each do |segment|
  tournament.tournament_segments.create!(segment_id: segment.id)
end

user1 = User.create!(email: "adam.n.conway@gmail.com", uid: "8722083", token: "489ed4cead0b0624997d0c026200a6912e8662b5", role: "admin", created_at: "2018-06-03 16:23:12", updated_at: "2018-06-03 16:24:08", name: "Adam Conway", status: "active")
segment1.user_segments.create!(user_id: user1.id, pr: 8218, perf_perc: segment1.kom_time / 8218.to_f)
segment2.user_segments.create!(user_id: user1.id, pr: 1135, perf_perc: segment2.kom_time / 1135.to_f)
segment3.user_segments.create!(user_id: user1.id, pr: 1298, perf_perc: segment3.kom_time / 1298.to_f)
segment4.user_segments.create!(user_id: user1.id, pr: 0, perf_perc: 0)
segment5.user_segments.create!(user_id: user1.id, pr: 792, perf_perc: segment5.kom_time / 792.to_f)
segment6.user_segments.create!(user_id: user1.id, pr: 0, perf_perc: 0)
segment7.user_segments.create!(user_id: user1.id, pr: 1958, perf_perc: segment7.kom_time / 1958.to_f)
tournament.user_tournaments.create!(user_id: user1.id, total_perf_perc: user1.user_segments.pluck(:perf_perc).sum)

user2 = User.create!(email: "bryan.bischof@gmail.com", uid: "26065", token: "7f83da4886e87219d18a55a7d122fdb56c6af308", role: "admin", created_at: "2018-06-03 20:22:00", updated_at: "2018-06-03 21:10:06", name: "Bryan Bischof", status: "active")
segment1.user_segments.create!(user_id: user2.id, pr: 0, perf_perc: 0)
segment2.user_segments.create!(user_id: user2.id, pr: 1078, perf_perc: segment2.kom_time / 1078.to_f)
segment3.user_segments.create!(user_id: user2.id, pr: 1211, perf_perc: segment3.kom_time / 1211.to_f)
segment4.user_segments.create!(user_id: user2.id, pr: 1655, perf_perc: segment4.kom_time / 1655.to_f)
segment5.user_segments.create!(user_id: user2.id, pr: 721, perf_perc: segment5.kom_time / 721.to_f)
segment6.user_segments.create!(user_id: user2.id, pr: 0, perf_perc: 0)
segment7.user_segments.create!(user_id: user2.id, pr: 0, perf_perc: 0)
tournament.user_tournaments.create!(user_id: user2.id, total_perf_perc: user2.user_segments.pluck(:perf_perc).sum)

user3 = User.create!(email: "ryan.f.schafer@gmail.com", uid: "12303297", token: "594408967689a0380127baafe7c56f2614faaece", role: "default", created_at: "2018-06-03 22:03:43", updated_at: "2018-06-03 22:44:39", name: "Ryan Schafer", status: "active")
segment1.user_segments.create!(user_id: user3.id, pr: 10020, perf_perc: segment1.kom_time / 10020.to_f)
segment2.user_segments.create!(user_id: user3.id, pr: 1655, perf_perc: segment2.kom_time / 1655.to_f)
segment3.user_segments.create!(user_id: user3.id, pr: 1879, perf_perc: segment3.kom_time / 1879.to_f)
segment4.user_segments.create!(user_id: user3.id, pr: 2381, perf_perc: segment4.kom_time / 2381.to_f)
segment5.user_segments.create!(user_id: user3.id, pr: 1400, perf_perc: segment5.kom_time / 1400.to_f)
segment6.user_segments.create!(user_id: user3.id, pr: 2299, perf_perc: segment6.kom_time / 2299.to_f)
segment7.user_segments.create!(user_id: user3.id, pr: 2466, perf_perc: segment7.kom_time / 2466.to_f)
tournament.user_tournaments.create!(user_id: user3.id, total_perf_perc: user3.user_segments.pluck(:perf_perc).sum)

# user4 = User.create!(email: "lgoerl@gmail.com", uid: "996434", token: "e037789ef8a8db87de9f8a8cea6e069af980121b", role: "default", created_at: "2018-06-04 17:48:50", updated_at: "2018-06-04 17:51:27", name: "lee goerl", status: "active")
# user5 = User.create!(email: "ktransier@gmail.com", uid: "1516573", token: "a80987cf30f34fa3d0f62315a9cc906eaf410e76", role: "default", created_at: "2018-06-04 20:20:36", updated_at: "2018-06-04 20:20:36", name: "Kenneth Transier", status: "active")
# user6 = User.create!(email: "david.lachasse@gmail.com", uid: "21136550", token: "92418d704c20da9d2bafdebb1a8d146f3c7238cb", role: "default", created_at: "2018-06-04 22:24:33", updated_at: "2018-06-04 22:27:19", name: "Dave La Chasse", status: "active")
# user7 = User.create!(email: "scottrocher@gmail.com", uid: "15342", token: "7a8b77ea1c232a07da2c92310ad0658e662179db", role: "default", created_at: "2018-06-04 22:32:33", updated_at: "2018-06-04 23:06:54", name: "Scott Rocher", status: "active")
# user8 = User.create!(email: "ndirienzo@gmail.com", uid: "4840268", token: "03bf639fc6312456ba3c46ad3e77b0076814b317", role: "default", created_at: "2018-06-07 04:33:02", updated_at: "2018-06-07 14:38:59", name: "Nick DiRienzo", status: "active")
# user9 = User.create!(email: "iankendrick@gmail.com", uid: "3489371", token: "d89d6dd3ab96d6ca4c3d4da21a5d67281ca1a725", role: "default", created_at: "2018-06-07 20:37:00", updated_at: "2018-06-07 20:39:41", name: "Ian Kendrick", status: "active")
# user10 = User.create!(email: "hoyhoy@gmail.com", uid: "283349", token: "678fe0f4456f5f48eaec43565ed8097d75404ee0", role: "default", created_at: "2018-06-12 05:23:22", updated_at: "2018-06-12 05:26:34", name: "Tony Perrie", status: "active")
