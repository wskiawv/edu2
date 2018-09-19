define("js/v4/player.js",
function(n) {
    function t(n) {
        var t = "jsoncallback" + (Math.random() + "").replace("0.", "");
        return n.songid > 0 ? (y(".js_into_comment").show(), y(".js_into_comment").attr("href", m.util.getSongUrl(n) + "#comment_box"), m.jQueryAjax.jsonp({
            url: location.protocol + "//c.y.qq.com/base/fcgi-bin/fcg_global_comment_h5.fcg",
            data: {
                cid: 205360772,
                reqtype: 1,
                biztype: I[n.songtype],
                topid: n.songid,
                cmd: 4,
                needmusiccrit: 0,
                pagenum: 0,
                pagesize: 0,
                lasthotcommentid: "",
                callback: t,
                format: "fs",
                domain: "qq.com"
            },
            type: "post",
            jsonpCallback: t,
            success: function(n) {
                if (!n || "object" != typeof n) return ! 1;
                var t = n.commenttotal || 0;
                t > 0 ? 10 > t ? (y(".js_into_comment").addClass("btn_comment9"), y(".js_into_comment").html('<span class="btn_comment__numbers"><i class="btn_comment__numb btn_comment__numb_' + parseInt(t) + '"></i></span><span class="icon_txt">评论</span>')) : 100 > t ? (y(".js_into_comment").addClass("btn_comment99"), y(".js_into_comment").html('<span class="btn_comment__numbers"><i class="btn_comment__numb btn_comment__numb_' + parseInt(t / 10) + '"></i><i class="btn_comment__numb btn_comment__numb_' + parseInt(t % 10) + '"></i></span><span class="icon_txt">评论</span>')) : 1e3 > t ? (y(".js_into_comment").addClass("btn_comment99"), y(".js_into_comment").html('<span class="btn_comment__numbers"><i class="btn_comment__numb btn_comment__numb_' + parseInt(t / 100) + '"></i><i class="btn_comment__numb btn_comment__numb_' + parseInt(t % 100 / 10) + '"></i><i class="btn_comment__numb btn_comment__numb_' + parseInt(t % 10) + '"></i></span><span class="icon_txt">评论</span>')) : (y(".js_into_comment").addClass("btn_comment99"), y(".js_into_comment").html('<span class="btn_comment__numbers"><i class="btn_comment__numb btn_comment__numb_9"></i><i class="btn_comment__numb btn_comment__numb_9"></i><i class="btn_comment__numb btn_comment__numb_9"></i><i class="btn_comment__numb btn_comment__numb_add"></i></span><span class="icon_txt">评论</span>')) : (y(".js_into_comment").removeClass("btn_comment99").removeClass("btn_comment9"), y(".js_into_comment").html('<span class="icon_txt">无评论</span>'))
            },
            error: function() {}
        }), void 0) : (y(".js_into_comment").hide(), !1)
    }
    function e(t, e, a) {
        function s(e, s, o, i, r, c) {
            c = c || !1,
            n.async("js/common/html/songlist.js",
            function(n) {
                n.init({
                    container: e,
                    specilData: s,
                    specialTpl: i,
                    reportType: m.reportMap.player,
                    actions: A,
                    from: 0,
                    callback: function() {
                        h.webkit ? h.webkit && y(".sb_overview").length > 0 && y(".sb_overview").css({
                            height: y(".player__bd").height() - 56
                        }) : k = y(".sb_scrollable").scrollbar({
                            overviewElement: ".sb_overview",
                            barElement: ".scroll_area",
                            onScrolled: function() {}
                        });
                        var n = [];
                        for (var e in s) {
                            var i = s[e];
                            for (var c in o) i && o[c] && i.songid == o[c].songid && n.push(i)
                        }
                        var _ = parseInt(m.cookie.get("yq_index")) || 0;
                        r && 0 == l || !t ? 4 == P.mode ? !t || 1 == t.list.length && 10050 == t.list[0].toptype ? (g.setPlayerList(!1, s, P.mode), setTimeout(function() {
                            g.playAnyPos(_)
                        },
                        500)) : g.setPlayerList(!0, s, P.mode) : (g.setPlayerList(!1, s, P.mode), setTimeout(function() {
                            g.playAnyPos(_)
                        },
                        500)) : g.setPlayerList(!1, s, P.mode),
                        (/Version.(\d+\.\d+)/i.exec(navigator.userAgent) || window.safariHandler) && setTimeout(function() {
                            g.playAnyPos(_)
                        },
                        500),
                        !h.webkit && k && k.scrollbar("scrollToY", 0),
                        h.webkit && (y(".sb_overview")[0].scrollTop = -10),
                        a && a(),
                        M._curSongInfo && (y("div.songlist__item", y('li[mid="' + M._curSongInfo.songid + '"]')).addClass("songlist__item--playing"), y(".js_play", y('li[mid="' + M._curSongInfo.songid + '"]')).attr("title", "暂停").html('<i class="list_menu__icon_pause"></i><span class="icon_txt">暂停</span>'))
                    }
                })
            })
        }
        m.cookie.set("yplayer_open", 1); {
            var o = t && 0 == t.play,
            l = (parseInt(m.cookie.get("yq_index")) || 0, m.player.getPlayerOptions().mod);
            m.player.getPlayerOptions().deleteList
        }
        o || 1 == l && (o = !0);
        var r = [];
        t && (y.each(t.list,
        function(n, t) {
            t && t.disabled && t.disabled || r.push(t)
        }), t.list = r),
        e = e || !1;
        var c = function(n) {
            {
                var t, e = "";
                Array.prototype.join
            }
            e += "";
            var a = n.list;
            for (i = 0; i < a.length; i++) {
                e += '\r\n                            <li mid="' + (null == (t = a[i].songid) ? "": t) + '" ix="' + (null == (t = a[i].ix) ? "": t) + '"  data-page="player" data-stat="y_new.player.songlist.dbclick">\r\n                                <div class="songlist__item">\r\n                                    <div class="songlist__edit sprite">\r\n                                        <input type="checkbox" class="songlist__checkbox">\r\n                                    </div>\r\n                                    <div class="songlist__number',
                i >= 99 && (e += " songlist__number--small"),
                e += '">' + (null == (t = i + 1) ? "": t) + '</div>\r\n                                    <div class="songlist__songname">\r\n                                        <span class="songlist__songname_txt" title="' + (null == (t = a[i].songname) ? "": _.escape(t)) + '">' + (null == (t = a[i].songname) ? "": _.escape(t)) + '</span>\r\n                                        <div class="mod_list_menu">\r\n					    <a href="javascript:;" class="list_menu__item list_menu__play js_play" data-stat="y_new.player.songlist.playone" data-page="player" title="播放">\r\n						<i class="list_menu__icon_play"></i>\r\n						<span class="icon_txt">播放</span>\r\n					    </a>\r\n					    <a href="javascript:;" class="list_menu__item list_menu__add js_fav" ',
                a[i].action.fav && 5 != a[i].songtype || (e += 'style="display:none;"'),
                e += ' data-stat="y_new.player.songlist.addone" title="添加到歌单" aria-haspopup="true">\r\n						<i class="list_menu__icon_add"></i>\r\n						<span class="icon_txt">添加到歌单</span>\r\n					    </a>\r\n					    <a href="javascript:;" class="list_menu__item list_menu__down js_down" ',
                (a[i].action.down_lq || a[i].action.down_hq || a[i].action.down_sq) && 5 != a[i].songtype || (e += 'style="display:none;"'),
                e += ' data-stat="y_new.player.songlist.downloadone" title="下载" aria-haspopup="true">\r\n						<i class="list_menu__icon_down"></i>\r\n						<span class="icon_txt">下载</span>\r\n					    </a>\r\n					    <a href="javascript:;" class="list_menu__item list_menu__share js_share" ',
                a[i].action.share && 5 != a[i].songtype || (e += 'style="display:none;"'),
                e += ' data-stat="y_new.player.songlist.shareone" title="分享" aria-haspopup="true">\r\n						<i class="list_menu__icon_share"></i>\r\n						<span class="icon_txt">分享</span>\r\n					    </a>\r\n                                        </div>\r\n                                    </div>\r\n				';
                for (var s = [], o = 0, l = a[i].singer.length; l > o; o++) {
                    var r = a[i].singer[o];
                    s.push(r.name)
                }
                e += '\r\n				    <div class="songlist__artist" title="' + (null == (t = s.join(" / ")) ? "": _.escape(t)) + '">\r\n					';
                for (var o = 0,
                l = a[i].singer.length; l > o; o++) {
                    var r = a[i].singer[o];
                    e += "\r\n					",
                    o > 0 && (e += "/"),
                    e += '\r\n					<a href="' + (null == (t = m.util.getSingerUrl(r)) ? "": t) + '" data-singermid="' + (null == (t = r.mid) ? "": t) + '" data-singerid="' + (null == (t = r.id) ? "": t) + '" title="' + (null == (t = r.name) ? "": _.escape(t)) + '" data-stat="y_new.player.songlist.singername" class="singer_name" data-page="player">' + (null == (t = r.name) ? "": _.escape(t)) + "</a>\r\n					"
                }
                e += '\r\n                                    </div>\r\n                                    <div class="songlist__time">' + (null == (t = a[i].playTime) ? "": t) + '</div>\r\n                                    <div class="songlist__other">\r\n					',
                1 == a[i].action.soso && (e += '\r\n					<a href="javascript:;" class="icon_sosomusic sprite">无版权</a>\r\n					'),
                e += '\r\n                                    </div>\r\n                                    <a href="javascript:;" class="songlist__delete js_delete" data-page="player" data-stat="y_new.player.songlist.delete" title="删除"><span class="icon_txt">删除</span></a>\r\n                                    <i class="player_songlist__line"></i>\r\n                                </div>\r\n                            </li>\r\n	'
            }
            return e += ""
        };
        setTimeout(function() {
            j.getAdd(e ? r: [], t && 0 != t.play ? !1 : !0,
            function(n) {
                n.length > 0 ? s(y("#song_box"), n, [], c, !!t && !!t.play) : a && a(),
                e && j.add(r, t && 0 != t.play ? !1 : !0)
            })
        },
        300)
    }
    function a(n) {
        P.mode = n,
        b.set("y_mod", [P.mode, P.volume, P.trans].join("|")),
        g.setMode(n)
    }
    function s(n) {
        j.get(function() {
            n && n()
        })
    }
    function o(n) {
        var t = parseInt(n / 60, 10),
        e = n % 60;
        return (10 > t ? "0" + t: t) + ":" + (10 > e ? "0" + e: e)
    }
    function l() {
        function t(t, a, s) {
            switch (t) {
            case "r":
                var o = window.open("//y.qq.com/portal/player_radio.html#id=" + a, "_self");
                o && (o.opener = null);
                break;
            case "t":
                n.async("js/common/html/toplistdata.js",
                function(n) {
                    n.init({
                        topId: parseInt(a),
                        topType: 0,
                        reportID: 0,
                        play: 0
                    },
                    function(n) {
                        s && m.cookie.set("yq_index", 0, null, null, 2400),
                        c({
                            list: n,
                            play: s
                        },
                        !0, {
                            toptype: 10005,
                            parentid: parseInt(a)
                        })
                    })
                });
                break;
            case "a":
                n.async("js/common/html/albumdata.js",
                function(n) {
                    n.init({
                        mid: a,
                        reportID: 0,
                        play: 0
                    },
                    function(n) {
                        s && m.cookie.set("yq_index", 0, null, null, 2400),
                        c({
                            list: n,
                            play: s
                        },
                        !0, {
                            toptype: 10002
                        })
                    })
                });
                break;
            case "si":
                break;
            case "p":
                n.async("js/common/html/playlistdata.js",
                function(n) {
                    n.init(a,
                    function(n) {
                        0 != n.length && (s && m.cookie.set("yq_index", 0, null, null, 2400), c({
                            list: n,
                            play: s
                        },
                        !0, {
                            toptype: 10014,
                            parentid: a
                        }))
                    })
                });
                break;
            case "s":
                n.async("js/common/html/songlist.js",
                function(t) {
                    t.getSongInfo(a, !0,
                    function(t, a) {
                        var o = m.player.formatMusics(a);
                        n.async("js/common/fav.js",
                        function(n) {
                            n.combineData(o,
                            function(n) {
                                0 != n.length && (s && m.cookie.set("yq_index", 0, null, null, 2400), c({
                                    list: n,
                                    play: s
                                },
                                !0, e || {
                                    toptype: 10050
                                }))
                            })
                        })
                    })
                })
            }
        } {
            var e = null;
            setInterval(function() {
                var n = parseInt(m.cookie.get("yq_playschange"));
                if (1 == n) {
                    m.cookie.set("yq_playschange", 0);
                    var a = m.cookie.get("yq_playdata").split("_");
                    if (m.cookie.set("yq_playdata", ""), a.length >= 2) {
                        var s = a[0],
                        o = a[1],
                        i = 1;
                        if (a.length > 2 && (i = parseInt(a[2])), ("r" == s || "t" == s || "p" == s) && o > 0 && t(s, o, i), "a" == s && t(s, o, i), "s" == s) {
                            var l = y.jStorage.get("addplaylist_new") ? y.jStorage.get("addplaylist_new").list: null,
                            r = 3;
                            if (l) e = y.jStorage.get("addplaylist_new").report || null,
                            t(s, l, i),
                            y.jStorage.deleteKey("addplaylist_new");
                            else var _ = setInterval(function() {
                                r--,
                                l = y.jStorage.get("addplaylist_new") ? y.jStorage.get("addplaylist_new").list: null,
                                l && (e = y.jStorage.get("addplaylist_new").report || null, t(s, l, i), y.jStorage.deleteKey("addplaylist_new"), _ && clearInterval(_)),
                                0 == r && _ && clearInterval(_)
                            },
                            1e3)
                        }
                    } else a.length > 0 && "s" == a[0] && c(y.jStorage.get("addplaylist"), !0, {
                        toptype: 10050
                    })
                }
                m.cookie.set("player_exist", 1)
            },
            100)
        }
    }
    function r(n) {
        var t = [];
        for (i = 0; i < n.length; i++) {
            var e = n[i]; (e && e.action && e.action.play || !(n.length > 1) && e.tryPlay) && (0 == e.type && (e.size128 <= 0 || e.interval <= 0) || 0 != e.type && !e.songurl || t.push(e))
        }
        if (0 == n.length) return [];
        if (1 == n.length) {
            if (! (n[0] && n[0].action && n[0].action.play)) {
                if (v.getUin() < 1e3 && n[0].pay && n[0].pay.payplay) return v.openLogin(),
                [];
                if (!t.length) return []
            }
        } else if (!t.length) return [];
        return t
    }
    function c(n, t, a) {
        n.list = r(n.list),
        y.each(n.list,
        function(t) {
            n.list[t].toptype = a.toptype || 0,
            n.list[t].parentid = a.parentid || 0,
            10050 == a.toptype ? n.list[t].parentid = n.list[t].songid: 10002 == a.toptype ? n.list[t].parentid = n.list[t].albumid: 0 == a.toptype && (n.list[t].toptype = 10050, n.list[t].parentid = n.list[t].songid)
        }),
        n && n.list && n.list.length > 0 && e(n, t,
        function() {}),
        m.cookie.set("player_exist", 1)
    } {
        var m = n("js/common/music.js"),
        p = (n("js/common/music/scroller.js"), m.statistics),
        d = n("js/common/module/webplayer.js"),
        g = d.interFace,
        u = n("js/common/module/lrcHandler.js"),
        f = n("js/common/module/qrcHandler.js"),
        y = m.$;
        m.jQueryAjax
    }
    window.MUSIC = m;
    var b = n("js/common/music/storage.js"),
    v = m.widget.user,
    h = m.userAgent,
    k = null,
    j = m.player_storage,
    w = {
        player_cover: "//y.gtimg.cn/mediastyle/yqq/extra/player_cover.png?max_age=31536000"
    },
    x = {
        p: function() {
            try {
                window.console && console.log([].slice.call(arguments).join("	"))
            } catch(n) {}
        }
    },
    I = {
        0 : "1",
        13 : "1",
        111 : "13",
        112 : "14",
        113 : "15"
    },
    C = -1,
    S = null,
    P = {
        pos: 0,
        volume: 75,
        trans: 0,
        mode: 3
    };
    _playlistBar = {},
    curBoxClassName = "js_full_box",
    _favlistBar = {};
    var q = function() {
        function n() {
            if (c) {
                c = !1;
                var n = g.getVolumn() || P.volume; (0 >= n || n > 100) && (n = 75),
                i = y("#spanvolumebar")[0],
                l = y("#spanvolumeop")[0],
                r = y("#spanvolume")[0],
                _oMute = y("#spanmute")[0],
                a(n),
                y("#voice,#spanvolume").on("click",
                function(n) {
                    n.preventDefault(),
                    n.stopPropagation();
                    var t = y(r),
                    e = n.pageX;
                    _change_vol = parseInt(100 * (e - t.offset().left) / t.width(), 10),
                    a(_change_vol)
                }),
                y(_oMute).on("click", t),
                y(l).on("mousedown",
                function(n) {
                    n.preventDefault(),
                    n.stopPropagation();
                    y("#voice")[0];
                    y(document).off("mousemove").on("mousemove", e),
                    y(document).on("mouseup",
                    function() {
                        y(document).off("mousemove")
                    });
                    y("#divplayer")
                })
            }
        }
        function t(n) {
            n.preventDefault(),
            n.stopPropagation(),
            c || (y(_oMute).hasClass("btn_big_voice--no") ? (y(_oMute).removeClass("btn_big_voice--no"), y(_oMute).html('<span class="icon_txt">关闭声音[M]</span>')) : (y(_oMute).addClass("btn_big_voice--no"), y(_oMute).html('<span class="icon_txt">打开声音[M]</span>')), g.mutePlayer(), p.pgvClickStat("y_new.player.opbanner.no_voice"))
        }
        function e(n) {
            n.preventDefault(),
            n.stopPropagation();
            var t = y(r),
            e = n.pageX;
            _change_vol = parseInt(100 * (e - t.offset().left) / t.width(), 10),
            a(_change_vol)
        }
        function a(n) {
            c || !isNaN(n) && n >= 0 && 101 > n && (i.style.width = n + "%", g.setVolumn(n), P.volume = n, b.set("y_mod", [P.mode, P.volume, P.trans].join("|")), y(_oMute).hasClass("btn_big_voice--no") && (y(_oMute).removeClass("btn_big_voice--no"), y(_oMute).html('<span class="icon_txt">关闭声音[M]</span>'), g.mutePlayer()))
        }
        function s() {
            var n = P.volume || g.getVolumn(); (0 > n || n > 100) && (n = 75),
            n += 5,
            a(n)
        }
        function o() {
            var n = P.volume || g.getVolumn(); (0 > n || n > 100) && (n = 75),
            n -= 5,
            a(n)
        }
        var i, l, r, c = !0;
        return {
            init: n,
            incVol: s,
            decVol: o,
            mute: t
        }
    } (),
    T = !1,
    L = function() {
        function n() {
            l = y("#spanplayer_bgbar")[0],
            p = y("#downloadbar")[0],
            r = y("#spanprogress_op")[0],
            c = y("#spanplaybar")[0],
            d = y("#time_show")[0],
            _ = y(l).width() - y(r).width() - 2 * y(r).offset().left - 1,
            y("#progress,#downloadbar,#spanplayer_bgbar").on("click",
            function(n) {
                n.preventDefault(),
                n.stopPropagation();
                var t = y(p),
                s = n.pageX,
                o = parseInt(100 * (s - t.offset().left) / t.width(), 10);
                e(o),
                a()
            }),
            y(c).on("click",
            function(n) {
                n.preventDefault(),
                n.stopPropagation();
                var t = y(l),
                s = n.pageX,
                o = parseInt(100 * (s - t.offset().left) / t.width(), 10);
                e(o),
                a()
            }),
            y(r).on("mousedown",
            function(n) {
                T = !0,
                n.preventDefault(),
                n.stopPropagation(); {
                    var e = (new Date).getTime(),
                    s = y(r),
                    o = n.pageX,
                    i = s.offset().left - y(l).offset().left,
                    c = {
                        left: i,
                        ex: o
                    };
                    y("#progress")[0]
                }
                y(document).off("mousemove").on("mousemove",
                function(n) {
                    if (T) {
                        var a = (new Date).getTime();
                        if (300 > a - e) return ! 1;
                        t(n, c)
                    }
                }),
                y(document).on("mouseup",
                function() {
                    T && (y(document).off("mousemove"), a(), T = !1)
                })
            })
        }
        function t(n) {
            n.preventDefault(),
            n.stopPropagation();
            var t = y("#spanplayer_bgbar").offset().left,
            a = n.pageX,
            s = parseInt(100 * (a - t) / y(l).width(), 10);
            e(s)
        }
        function e(n) {
            if (!isNaN(n) && n >= 0 && 101 > n) {
                var t = g.getDownloadProgress();
                n = Math.min(n, t),
                c.style.width = n + "%",
                f = n,
                b = n;
                var e = parseInt(y("#time_show").data("total"));
                e > 0 && n % 3 == 0 && (document.getElementById("time_show").innerText = o(parseInt(n * e / 100, 10)) + " / " + o(e))
            }
        }
        function a() {
            var n = g.getDownloadProgress(),
            t = b || f;
            t = Math.min(t, n) + 1;
            var e = g.getSongDuration(),
            a = t * e / 100,
            o = parseInt(a);
            M._isPlaying ? (g.setPlayProgress(o), s(o)) : A.play(S,
            function() {
                g.setPlayProgress(o),
                s(o)
            })
        }
        function s(n) { !! (h.safari || h.chrome || h.isiPad || h.isiPhone);
            if (u.haveLrc) {
                var t = y('p[data-id="line_' + u.lrcItemIndex + '"]');
                if (t.length > 0 && t.removeClass("on"), u.getLyricLineItemByPlayTime(u.ms2playTime(parseInt(1e3 * n)))) {
                    var e = u.lrcItemIndex,
                    a = 0;
                    y.each(y(".qrc_ctn"),
                    function(n, t) {
                        if ("none" != y(t).parents(".js_box").css("display")) {
                            e = u.lrcItemIndex;
                            var s = parseInt(y(t).data("mod")),
                            o = {
                                1 : "js_full_box",
                                2 : "js_simp_box"
                            } [s];
                            if (curBoxClassName == o) {
                                for (; e-->(1 == s ? 1 : 3);) {
                                    var i = y('p[data-id="line_' + e + '"]', y(t))[0];
                                    a += i ? i.offsetHeight: 1 == s ? 24 : 0
                                }
                                0 > a && (a = 0),
                                m.util.supportCss3("-webkit-transition") && m.util.supportCss3("-webkit-transform") ? (t.style.webkitTransition = "-webkit-transform 0.1s ease-out", t.style.webkitTransform = "translateY(" + -1 * a + "px)") : m.util.supportCss3("transition") && m.util.supportCss3("transform") ? (t.style.transition = "transform 0.1s ease-out", t.style.transform = "translateY(" + -1 * a + "px)") : y(t).parent(".js_lyric_box").scrollTop(a)
                            }
                        }
                    });
                    var s = ( - 1 == u.preLrcItemIndex ? "null": u.preLrcItemIndex, u.lrcItemIndex),
                    o = y('p[data-id="line_' + s + '"]', "." + curBoxClassName);
                    if (o.length > 0) {
                        if (s > 0) {
                            var i = y("p", "." + curBoxClassName);
                            i.length > 0 && i.removeClass("on")
                        }
                        o.html(u.lrcItem.context).addClass("on"),
                        y(".js_trans_btn").hasClass("btn_lang--select") ? y(".js_trans_line").show() : y(".js_trans_line").hide()
                    }
                    u.restartAnimFrame("qrc_ctn")
                }
            }
        }
        function i() {
            y(l).off("click"),
            y(c).off("click"),
            y(r).off("mousedown")
        }
        var l, r, c, _, p, d = null,
        f = 0,
        b = 0;
        return {
            init: n,
            update: e,
            destroy: i
        }
    } (),
    D = !0,
    M = function() {
        function e(n, t) {
            var e = new Image;
            t = t || "74",
            e.src = "//c.y.qq.com/tplcloud/fcgi-bin/fcg_reportlsting_web.fcg?musicid=" + t + "&isexit=" + n + "&g_tk=" + m.getACSRFToken() + "&_r=" + (new Date).valueOf(),
            e.style.width = "0",
            e.style.height = "0"
        }
        function s() {
            y("#opbanner, #song_info").off("click", ".js_song").on("click", ".js_song",
            function() {
                var n = y(this).data("mid"),
                t = y(this).data("id"),
                e = y(this).data("songtype"),
                a = y(this).data("shareuin"),
                s = y(this).data("disstid"),
                o = {
                    mid: n
                };
                return t && (o.id = t),
                e && (o.songtype = e),
                a && (o.shareuin = a),
                s && (o.disstid = s),
                m.util.gotoSongdetail(o),
                !1
            }).off("click", ".js_singer").on("click", ".js_singer",
            function() {
                var n = y(this).data("singermid"),
                t = y(this).data("stat") || "",
                e = {
                    singermid: n
                };
                return t && (e.stat = t),
                m.util.gotoSinger(e),
                !1
            }).off("click", ".js_album").on("click", ".js_album",
            function() {
                var n = y(this).data("albummid"),
                t = y(this).data("stat") || "",
                e = {
                    albummid: n
                };
                return t && (e.stat = t),
                n ? (m.util.gotoAlbum(e), !1) : void 0
            }).on("click", "#btnplay",
            function(n) {
                D && (p.pgvClickStat("y_new.player.opbanner.play_btn"), D = !0);
                var t = i;
                return "g_first_play" == t ? (n.preventDefault(), n.stopPropagation(), A.play(), void 0) : "g_play" == t ? (n.preventDefault(), n.stopPropagation(), g.pausePlayer(), f.haveqrc && f.stopAnimFrame(), u.haveLrc && u.stopAnimFrame(), void 0) : ("g_pause" == t && (n.preventDefault(), n.stopPropagation(), g.startPlayer(), f.haveqrc ? f.startAnimFrame("qrc_ctn") : u.haveLrc && u.startAnimFrame("qrc_ctn")), "g_wait" == t && g.startPlayer(), void 0)
            }).on("click", ".btn_big_prev",
            function(n) {
                M.prev(n),
                p.pgvClickStat("y_new.player.opbanner.prev")
            }).on("click", ".btn_big_next",
            function(n) {
                M.next(n),
                p.pgvClickStat("y_new.player.opbanner.next")
            }).on("click", "#play_mod",
            function() {
                M.realSetPlayWay()
            }).on("click", "#simp_btn",
            function() {
                p.pgvClickStat("y_new.player.opbanner.clear_mod"),
                y(this).hasClass("btn_big_only--on") ? (y(this).removeClass("btn_big_only--on"), y(this).attr("title", "打开纯净模式[C]"), y(".js_full_box").show(), y(".js_simp_box").hide(), curBoxClassName = "js_full_box") : (y(this).addClass("btn_big_only--on"), y(this).attr("title", "关闭纯净模式[C]"), y(".js_full_box").hide(), y(".js_simp_box").show(), curBoxClassName = "js_simp_box")
            })
        }
        var i = "g_first_play",
        l = null,
        r = function(n, t) {
            var e = y("#btnplay"),
            a = n || "pause",
            s = t || "g_pause";
            "pause" == a ? (y(".js_play", y("#song_box .songlist__item--playing")).attr("title", "播放").html('<i class="list_menu__icon_play"></i><span class="icon_txt">播放</span>'), y("#song_box .songlist__item--playing").removeClass("songlist__item--playing"), e.removeClass("btn_big_play--pause"), y("span", e).html("播放")) : (M._curSongInfo && (y("div.songlist__item", y('li[mid="' + M._curSongInfo.songid + '"]')).addClass("songlist__item--playing"), y(".js_play", y('li[mid="' + M._curSongInfo.songid + '"]')).attr("title", "暂停").html('<i class="list_menu__icon_pause"></i><span class="icon_txt">暂停</span>')), e.addClass("btn_big_play--pause"), y("span", e).html("暂停")),
            i = s
        };
        return {
            _setQQstatus: e,
            _isPlaying: !1,
            _isFirst: !0,
            _curSongInfo: null,
            _errorPlayId: [],
            clearlist: !1,
            init: function() {
                g.OnSongPlayBegin = function(n, t) {
                    m.cookie.set("yq_index", t, null, null, 2400),
                    x.p("OnSongPlayBegin begin:" + (new Date).getUTCMilliseconds()),
                    M._isPlaying = !0,
                    M._curSongInfo = n,
                    setTimeout(function() {
                        var t = parseInt(parseInt(y(".sb_scrollable").css("height")) / 50) - 2;
                        y(".sb_overview").scrollTop() < 50 * (n.ix - t) ? (!h.webkit && k && k.scrollbar("scrollToY", 50 * (n.ix - t)), h.webkit && (y(".sb_overview")[0].scrollTop = 50 * (n.ix - t))) : y(".sb_overview").scrollTop() > 50 * n.ix && (!h.webkit && k && k.scrollbar("scrollToY", 50 * n.ix), h.webkit && (y(".sb_overview")[0].scrollTop = 50 * n.ix))
                    },
                    1e3),
                    "mod_songname_menu__like--liked" == n.fav ? (y(".js_btn_fav", "#opbanner").addClass("btn_big_like--like"), y(".js_btn_fav").attr("title", "取消喜欢[V]")) : (y(".js_btn_fav", "#opbanner").removeClass("btn_big_like--like"), y(".js_btn_fav").attr("title", "喜欢[V]")),
                    setTimeout(function() {
                        f.clearQrcInfo(),
                        !!n && f.init({
                            songtype: n.songtype,
                            songMId: n.songmid,
                            songId: n.songid,
                            qrcContainer: "qrc_ctn"
                        }),
                        u.clearLrcInfo()
                    },
                    200),
                    b.get("y_mod",
                    function(n) {
                        if (n) {
                            var t = n.split("|");
                            t.length > 0 && (P.mode = parseInt(t[0])),
                            t.length > 1 && (P.volume = parseInt(t[1])),
                            t.length > 2 && (P.trans = parseInt(t[2]))
                        }
                        1 == P.trans ? (y(".js_trans_btn").removeClass("btn_lang--select"), y(".js_trans_line").show()) : (y(".js_trans_line").hide(), y(".js_trans_btn").addClass("btn_lang--select")),
                        q.init()
                    }),
                    L.init(),
                    M.renderSong(n),
                    setTimeout(function() { !! n && e(!1, n.songid)
                    },
                    700)
                },
                g.OnSongPlayEnd = function() {
                    M._isPlaying = !1,
                    r("pause", "g_play"),
                    f.haveqrc ? f.clearQrcInfo() : u.haveLrc && u.clearLrcInfo(),
                    document.title = "QQ音乐-千万正版音乐海量无损曲库新歌热歌天天畅听的高品质音乐平台！"
                },
                g.OnSongPlaying = function(n, t) {
                    if (g.setVolumn(P.volume), -1 == C && (C = 0), !isNaN(n) && !isNaN(t)) {
                        var e = !!(h.safari || h.chrome || h.isiPad || h.isiPhone),
                        a = e ? parseInt(n / 1e3) : n,
                        s = y(".qrc_ctn");
                        if (M._isPlaying) {
                            if (y("#time_show").data("total", t), T || (y("#time_show").html(o(parseInt(a, 10)) + " / " + o(t)), P.pos = parseInt(100 * a / t, 10), y("#spanplaybar").width(P.pos + "%")), f.reqFlag) return;
                            var i = y("p", s).length > 1 ? y("p:eq(1)", s) : "";
                            if (f.haveqrc && ("歌词正在加载中..." == i || "" == i)) return s.html('<p data-id="line_null" class="on">&nbsp;</p>' + f.printQrcLines()),
                            f.startAnimFrame("qrc_ctn"),
                            void 0;
                            if (!f.haveqrc && -1 == u.reqFlag) return u.init(f.playingSongInfo),
                            void 0;
                            if (!f.haveqrc && 0 == u.reqFlag) return;
                            if (!f.haveqrc && 1 == u.reqFlag) {
                                if (u.haveLrc && ("歌词正在加载中..." == i || "" == i)) {
                                    var l = u.printLrcLines();
                                    return "" == l ? (u.haveLrc = !1, '<p>&nbsp;</p><p><a href="javascript:;" class="js_btn_feedback">该单曲暂无歌词，点击这里进行反馈</a></p>' != s.html() && 0 == u.txtLrc && s.html('<p>&nbsp;</p><p><a href="javascript:;" class="js_btn_feedback">该单曲暂无歌词，点击这里进行反馈</a></p>'), void 0) : (s.html('<p data-id="line_null" class="on">&nbsp;</p>' + l), u.startAnimFrame("qrc_ctn"), void 0)
                                }
                                if (!u.haveLrc) return '<p>&nbsp;</p><p><a href="javascript:;" class="js_btn_feedback">该单曲暂无歌词，点击这里进行反馈</a></p>' != s.html() && 0 == u.txtLrc && s.html('<p>&nbsp;</p><p><a href="javascript:;" class="js_btn_feedback">该单曲暂无歌词，点击这里进行反馈</a></p>'),
                                void 0
                            }
                            if (u.haveLrc) {
                                if (u.getLyricLineItemByPlayTime(u.ms2playTime(e ? n: 1e3 * n))) {
                                    var r = -1 == u.preLrcItemIndex ? "null": u.preLrcItemIndex,
                                    c = u.lrcItemIndex,
                                    _ = y("." + curBoxClassName + ' p[data-id="line_' + c + '"]');
                                    _.length > 0 && c != r && (c > 0 && y("p", "." + curBoxClassName).removeClass("on"), _.addClass("on"))
                                }
                            } else '<p>&nbsp;</p><p><a href="javascript:;" class="js_btn_feedback">该单曲暂无歌词，点击这里进行反馈</a></p>' != s.html() && 0 == u.txtLrc && s.html('<p>&nbsp;</p><p><a href="javascript:;" class="js_btn_feedback">该单曲暂无歌词，点击这里进行反馈</a></p>')
                        }
                    }
                },
                g.OnPlaying = function() {
                    r("play", "g_play"),
                    M._errorPlayId = []
                },
                g.OnPlayPause = function() {
                    r("pause", "g_pause")
                },
                g.OnPlayError = function(n) {
                    3 == n.type || 0 == n.type && 1 == n.action.soso;
                    if (!M._errorPlayId[n.playid]) {
                        M._errorPlayId[n.playid] = 1;
                        var t = y("#song_box");
                        if (t.length > 0) {
                            var e = y("li", t);
                            e && e.length > 1 && g.nextPlayer()
                        }
                    }
                    document.title = "QQ音乐-千万正版音乐海量无损曲库新歌热歌天天畅听的高品质音乐平台！"
                },
                g.OnSongDownloading = function(n) {
                    var t = y("#downloadbar");
                    t.length > 0 && t.width(n + "%")
                },
                b.get("y_mod",
                function(n) {
                    if (n) {
                        var t = n.split("|");
                        t.length > 0 && (P.mode = parseInt(t[0])),
                        t.length > 1 && (P.volume = parseInt(t[1])),
                        t.length > 2 && (P.trans = parseInt(t[2]))
                    }
                    M.realSetPlayWay(P.mode),
                    a(P.mode),
                    g.setVolumn(P.volume)
                }),
                M.renderSong(),
                s()
            },
            setPlayBtnStatus: function() {},
            renderSong: function(n) {
                function e() {
                    document.title = o.substring(i, o.length) + o.substring(0, i),
                    i++,
                    i > o.length && (i = 0),
                    l = setTimeout(function() {
                        e()
                    },
                    500)
                }
                function a(n) {
                    var t = [];
                    return y.each(n,
                    function(n, e) {
                        t.push('<a href="' + m.util.getSingerUrl({
                            mid: e.mid
                        }) + '#stat=y_new.player.info_area.singername" onclick="setStatCookie&&setStatCookie();" title="' + e.name + '" class="js_singer" data-stat="y_new.player.info_area.singername" data-singermid="' + e.mid + '" rel="noopener nofollow" target="_blank">' + e.name + "</a>")
                    }),
                    t.join(" / ")
                }
                x.p("renderSong begin:" + (new Date).getUTCMilliseconds());
                var s = y("#song_box");
                if (!n) return y("#sim_song_info,#song_name,#singer_name,#album_name,#time_show").html(""),
                y("#song_pic").parents("a.js_album").data("albummid", 0),
                y("#backImg").css("backgroundImage", ""),
                y("#song_pic").attr("src", w.player_cover),
                y("body").css("backgroundColor", "#292a2b"),
                void 0;
                l && (clearTimeout(l), l = null),
                document.title = "正在播放 " + n.songname + (n.singername ? "-" + n.singername: "");
                var o = document.title;
                o = "…" + o;
                var i = 0;
                h.sougou || e();
                var r = n.ix;
                if (s.length > 0) {
                    var c = y("li", s);
                    c.length > r && (y(".js_play", y("#song_box .songlist__item--playing")).attr("title", "播放").html('<i class="list_menu__icon_play"></i><span class="icon_txt">播放</span>'), y("div.songlist__item").removeClass("songlist__item--playing"), M._curSongInfo && (y("div.songlist__item", y('li[mid="' + M._curSongInfo.songid + '"]')).addClass("songlist__item--playing"), y(".js_play", y('li[mid="' + M._curSongInfo.songid + '"]')).attr("title", "暂停").html('<i class="list_menu__icon_pause"></i><span class="icon_txt">暂停</span>')))
                }
                if (y("#sim_song_info,#song_name,#singer_name,#album_name,#time_show").html(""), n && n.songmid && "" != n.songmid ? y("#sim_song_info").html('<a href="' + m.util.getSongUrl(n) + '#stat=y_new.player.info_area.songname" onclick="setStatCookie&&setStatCookie();" title="' + n.songname + '" class="js_song" data-stat="y_new.player.info_area.songname" data-mid="' + n.songmid + '" data-id="' + n.songid + '" data-songtype="' + n.songtype + '" data-disstid="' + (n.disstid ? n.disstid: "") + '" rel="noopener nofollow" target="_blank">' + n.songname + "</a> - " + a(n.singer)) : y("#sim_song_info").html('<a title="' + n.songname + '">' + n.songname + '</a> - <a title="' + n.singername + '">' + n.singername + "</a>"), n.albummid && "" != n.albummid) {
                    y("#song_pic").parents("a.js_album").data("albummid", n.albummid);
                    var _ = new Image;
                    _.src = 8623 == n.albumid && n.singer.length > 0 && n.singer[0].id > 0 ? m.util.getSingerPic({
                        mid: n.singer[0].mid,
                        type: 300
                    }) : m.util.getAlbumPic({
                        mid: n.albummid,
                        type: 300
                    }),
                    y("#song_pic").attr("src", _.src),
                    _.style.width = "0",
                    _.style.height = "0",
                    _.onload = function() {
                        y("#backImg").css("backgroundImage", "url(" + _.src + ")"),
                        y("#song_pic").attr("src", _.src)
                    },
                    m.jQueryAjax.jsonp({
                        url: "//c.y.qq.com/v8/fcg-bin/fcg_v8_album_info_cp.fcg?albummid=" + n.albummid,
                        charset: "utf-8",
                        jsonpCallback: "albuminfoCallback",
                        success: function(n) {
                            0 == n.code && n.data.color > 0 ? y("body").css("backgroundColor", "#" + n.data.color.toString(16)) : y("body").css("backgroundColor", "#292a2b")
                        },
                        error: function() {
                            y("body").css("backgroundColor", "#292a2b")
                        }
                    }),
                    111 == n.songtype || 112 == n.songtype || 113 == n.songtype ? y("#song_name").html("歌曲名：<a href='" + m.util.getSongUrl({
                        songid: n.songid,
                        songtype: n.songtype
                    }) + "#stat=y_new.player.info_area.songname' onclick='setStatCookie&&setStatCookie();' title='" + n.songname + "' target='_blank'>" + n.songname + "</a>") : n.songmid ? y("#song_name").html("歌曲名：<a href='" + m.util.getSongUrl({
                        songmid: n.songmid
                    }) + "#stat=y_new.player.info_area.songname' onclick='setStatCookie&&setStatCookie();' title='" + n.songname + "' target='_blank'>" + n.songname + "</a>") : y("#song_name").html("歌曲名：" + n.songname),
                    n.singer.length > 0 && n.singer[0].id > 0 && y("#singer_name").html("歌手名：" + a(n.singer)),
                    n.albumid > 0 && n.albumname && y("#album_name").html("专辑名：<a href='" + m.util.getAlbumUrl({
                        albummid: n.albummid
                    }) + "#stat=y_new.player.info_area.albumname' onclick='setStatCookie&&setStatCookie();' title='" + n.albumname + "' target='_blank'>" + n.albumname + "</a>")
                } else {
                    y("#song_pic").parents("a.js_album").data("albummid", 0);
                    var _ = new Image;
                    _.src = w.player_cover,
                    _.style.width = _.style.height = "0",
                    _.onload = function() {
                        y("#backImg").css("backgroundImage", ""),
                        y("body").css("backgroundColor", "#292a2b"),
                        y("#song_pic").attr("src", w.player_cover)
                    },
                    n && (111 == n.songtype || 112 == n.songtype || 113 == n.songtype ? (y("#song_name").html("歌曲名：<a href='" + m.util.getSongUrl({
                        songid: n.songid,
                        songtype: n.songtype
                    }) + "#stat=y_new.player.info_area.songname' onclick='setStatCookie&&setStatCookie();' title='" + n.songname + "' target='_blank'>" + n.songname + "</a>"), n.singer.length > 0 && n.singer[0].id > 0 && y("#singer_name").html("歌手名：" + a(n.singer))) : (y("#song_name").html("歌曲名：" + n.songname), y("#singer_name").html("歌手名：" + n.singername), y("#album_name").html("")))
                }
                t(n),
                x.p("renderSong end:" + (new Date).getUTCMilliseconds())
            },
            resetLikeIcon: function() {},
            updateSongLike: function() {},
            songHover: function() {},
            play: function(n, t, e) {
                if (x.p("play begin:" + (new Date).getUTCMilliseconds()), t && 1 == t) return D = !1,
                y("#btnplay").click(),
                void 0;
                var a = 0;
                n && n.length > 0 && (a = n[0].ix),
                C = 0,
                m.cookie.set("yq_index", a, null, null, 2400),
                g.playAnyPos(a),
                e && e()
            },
            trogglePlay: function() {},
            prev: function(n) {
                n.preventDefault(),
                n.stopPropagation(),
                g.lastPlayer()
            },
            next: function(n) {
                n.preventDefault(),
                n.stopPropagation();
                var t = this;
                j.get(function() { - 1 == C ? t.play() : g.nextPlayer()
                })
            },
            like: function() {},
            share: function() {},
            _objSong: null,
            fav: function(t, e, a, s) {
                t = t || M._curSongInfo,
                t && n.async("js/common/html/songlist.js",
                function(o) {
                    o.getSongInfo([t], !0,
                    function(t, o) {
                        n.async("js/common/fav.js",
                        function(n) {
                            e ? n.like(o,
                            function() {
                                a && a()
                            }) : n.unlike(o,
                            function() {
                                s && s()
                            })
                        })
                    })
                })
            },
            download: function(t) {
                t = t || M._curSongInfo,
                t && n.async("js/common/html/songlist.js",
                function(e) {
                    e.getSongInfo([t], !0,
                    function(t, e) {
                        n.async("js/common/download.js",
                        function(n) {
                            n.show(e)
                        })
                    })
                })
            },
            add: function() {},
            delBatch: function(n) {
                function t(n, t) {
                    return t.ix - n.ix
                }
                var e = [];
                n.sort(t),
                y.each(n,
                function(n, t) {
                    e.push(t.ix),
                    M.del(t)
                }),
                j.delBatch(e)
            },
            del: function(n) {
                var t = n.ix;
                t >= 0 && !g.delSong(t) && (M.renderSong(), M._isPlaying = !1, g.stopPlayer())
            },
            insert: function() {},
            clearList: function() {},
            setPlayWay: function() {},
            modIndex: 0,
            realSetPlayWay: function(n) {
                n = n || -1;
                var t = ["顺序播放", "随机播放", "单曲循环", "列表循环"],
                e = [2, 4, 1, 3],
                a = ["btn_big_style_order", "btn_big_style_random", "btn_big_style_single", "btn_big_style_list"];
                if (n >= 0) for (var s in e) n == e[s] && (M.modIndex = parseInt(s));
                else M.modIndex++;
                M.modIndex > 3 && (M.modIndex = 0),
                y("#play_mod")[0].className = a[M.modIndex],
                y("#play_mod").html('<span class="icon_txt">' + t[M.modIndex] + "[O]</span>").attr("title", t[M.modIndex] + "[O]"),
                g.setMode(e[M.modIndex]),
                P.mode = e[M.modIndex],
                b.set("y_mod", [P.mode, P.volume].join("|")),
                0 > n && p.pgvClickStat("y_new.player.opbanner." + a[M.modIndex].replace("btn_big_style", "play_mod"))
            },
            getCurSongInfo: function() {
                return M._curSongInfo
            }
        }
    } (),
    A = {
        init: function() {
            function t() {
                j.get(function(n) {
                    var t = {},
                    e = [];
                    y.each(n,
                    function(n, e) {
                        t[e.songid] = e
                    });
                    var a = y(".songlist__list li"),
                    s = 0;
                    y.each(a,
                    function(n, a) {
                        var o = y(a).attr("mid");
                        if (y(a).attr("ix", n), y(".songlist__number", y(a)).html(n + 1), y(".songlist__item--playing", y(a)).length > 0 && (s = n), o in t) {
                            var i = t[o];
                            i.ix = n,
                            e.push(i)
                        }
                    }),
                    e.length > 0 && (j.clear(), j.add(e), g.setPlayerList(!1, e, P.mode), m.cookie.set("yq_index", s, null, null, 2400), g.setPostion(s))
                })
            }
            function a(n) {
                y(".songlist__drag").css({
                    left: n.pageX - 180 + "px",
                    top: n.pageY - 180 + "px"
                })
            }
            g.init({
                fromtag: 30,
                statFromtag: 7,
                errorTips: function(n, t) {
                    m.popup.show(n + t, 3e3, 1)
                }
            }),
            M.init(),
            y.jStorage.reInit(),
            m.cookie.set("yplayer_open", 1),
            l();
            var o = y.jStorage.get("addplaylist");
            s(function() {
                o ? c(o, !0, o ? o.report: null) : e(o, !1,
                function() {}),
                y.jStorage.deleteKey("addplaylist")
            }),
            y.jStorage.subscribe("focusplayer",
            function(n, t) {
                t.status && (alert("窗口已打开！"), window.focus()),
                m.cookie.set("player_exist", 1)
            }),
            h.webkit && y(".sb_overview").css({
                height: y(".player__bd").height() - 56
            }),
            y(".qrc_ctn").on("mousedown",
            function(n) {
                n.preventDefault(),
                n.stopPropagation(),
                window.getlyricflag = !0,
                u.haveLrc && u.stopAnimFrame("qrc_ctn");
                var t = n.pageY,
                e = [];
                y.each(y(".qrc_ctn"),
                function(n, t) {
                    if (m.util.supportCss3("transform") || m.util.supportCss3("-webkit-transform")) {
                        e[n] = 0;
                        var a = t.style,
                        s = a.transform || a.webkitTransform || "",
                        o = s.split("(");
                        o && o.length > 1 && (e[n] = -1 * parseInt(o[1]))
                    } else e[n] = y(t).parent(".js_lyric_box").scrollTop()
                }),
                y(document).off("mousemove").on("mousemove",
                function(n) {
                    u.haveLrc && u.stopAnimFrame(),
                    (u.haveLrc || u.txtLrc) && y.each(y(".qrc_ctn"),
                    function(a, s) {
                        if ("none" != y(s).parents(".js_box").css("display")) {
                            var o = e[a] + (t - n.pageY);
                            0 > o && (o = 0),
                            m.util.supportCss3("-webkit-transition") && m.util.supportCss3("-webkit-transform") ? (s.style.webkitTransition = "-webkit-transform 0.1s ease-out", s.style.webkitTransform = "translateY(" + -1 * o + "px)") : m.util.supportCss3("transition") && m.util.supportCss3("transform") ? (s.style.transition = "transform 0.1s ease-out", s.style.transform = "translateY(" + -1 * o + "px,0px)") : y(s).parent(".js_lyric_box").scrollTop(o)
                        }
                    })
                });
                var a = 0;
                y(document).on("mouseup",
                function() {
                    y(document).off("mousemove"),
                    a++,
                    t = 0,
                    setTimeout(function() {
                        t || (u.haveLrc && window.getlyricflag && 1 == a && (u.startAnimFrame("qrc_ctn"), window.getlyricflag = !1), a--)
                    },
                    3e3)
                })
            }).on("mousewheel",
            function() {
                return ! 1
            }),
            y(".js_btn_fav", "#opbanner").on("click",
            function() {
                var n = y(this);
                M.fav(null, y(this).hasClass("btn_big_like--like") ? 0 : 1,
                function() {
                    n.addClass("btn_big_like--like")
                },
                function() {
                    n.removeClass("btn_big_like--like")
                }),
                p.pgvClickStat("y_new.player.opbanner.love")
            }),
            y(".js_btn_down", "#opbanner").on("click",
            function() {
                M.download(null),
                p.pgvClickStat("y_new.player.opbanner.download")
            }),
            y(document).on("like",
            function(n, t) {
                var e = [],
                a = t.data,
                s = t.flag;
                y.each(a,
                function(n, t) { !! t && e.push(t.songid),
                    M._curSongInfo && t && t.songid == M._curSongInfo.songid && (s ? y(".js_btn_fav", "#opbanner").addClass("btn_big_like--like") : y(".js_btn_fav", "#opbanner").removeClass("btn_big_like--like"), s ? y(".js_btn_fav").attr("title", "取消喜欢[V]") : y(".js_btn_fav").attr("title", "喜欢[V]"))
                }),
                g.setSongsFavStatus(e, s ? "mod_songname_menu__like--liked": "")
            }).on("delete",
            function(n, t) {
                var e = t.data;
                M.delBatch(e),
                M._curSongInfo && (y(".js_play", y("#song_box .songlist__item--playing")).attr("title", "播放").html('<i class="list_menu__icon_play"></i><span class="icon_txt">播放</span>'), y("div.songlist__item").removeClass("songlist__item--playing"), y("div.songlist__item", y('li[mid="' + M._curSongInfo.songid + '"]')).addClass("songlist__item--playing"), y(".js_play", y('li[mid="' + M._curSongInfo.songid + '"]')).attr("title", "暂停").html('<i class="list_menu__icon_pause"></i><span class="icon_txt">暂停</span>')),
                k && k.resize()
            }).on("click", ".js_trans_btn",
            function() {
                var n = y(".btn_big_only--on").length > 0;
                y(this).hasClass("btn_lang--select") ? (y(".js_trans_line").hide(), y(".js_trans_btn").removeClass("btn_lang--select"), P.trans = 0, p.pgvClickStat("y_new.player.translyric.open" + (n ? ".clear": ""))) : (y(".js_trans_btn").addClass("btn_lang--select"), y(".js_trans_line").show(), P.trans = 1, p.pgvClickStat("y_new.player.translyric.close" + (n ? ".clear": ""))),
                b.set("y_mod", [P.mode, P.volume, P.trans].join("|"))
            }).on("click", ".js_opts_login,.js_opts_unlogin",
            function() {
                var t = function(n) {
                    {
                        var t = "";
                        Array.prototype.join
                    }
                    return t += '	<div class="form__part">\r\n            <div class="form__label">历史播放列表</div>\r\n            <span class="mod_form_check">\r\n                <label class="form_check__label"><span class="form_check__checkbox ',
                    n.deleteList || (t += "sprite form_check__checkbox--check"),
                    t += '"><input type="checkbox" name="privacy" class="form_check__check js_player_delete"></span>保留（勾选后，每次新打开播放器，将保留上次关闭时的播放列表）</label>\r\n            </span>\r\n        </div>\r\n        <div class="form__part">\r\n            <div class="form__label">播放设置</div>\r\n            <span class="mod_form_radio">\r\n                <label class="form_radio__label"><span class="form_radio__radiobox sprite ',
                    0 == n.mod && (t += "form_radio__radiobox--check"),
                    t += '" data-mod="0"><input type="radio" name="privacy" class="form_radio__radio js_player_mods"></span>立即播放<span class="c_tx_thin">(默认添加到播放队列最顶部)</span></label>\r\n            </span>\r\n            <span class="mod_form_radio">\r\n                <label class="form_radio__label"><span class="form_radio__radiobox sprite ',
                    1 == n.mod && (t += "form_radio__radiobox--check"),
                    t += '" data-mod="1"><input type="radio" name="privacy" class="form_radio__radio js_player_mods"></span>添加到播放队列末尾</label>\r\n            </span>\r\n            <span class="mod_form_radio">\r\n                <label class="form_radio__label"><span class="form_radio__radiobox sprite ',
                    2 == n.mod && (t += "form_radio__radiobox--check"),
                    t += '" data-mod="2"><input type="radio" name="privacy" class="form_radio__radio js_player_mods"></span>下一首播放</label>\r\n            </span>\r\n        </div>\r\n\r\n        <div class="c_tx_thin">设置仅对当前电脑有效，清除Cookie后将恢复为默认设置。</div>'
                } (m.player.getPlayerOptions());
                n.async("js/common/dialog.js",
                function(n) {
                    n.show({
                        title: "播放器设置",
                        dialogclass: "popup_player",
                        mode: "common",
                        width: 600,
                        content: t,
                        button_info1: {
                            fn: function() {
                                n.hide()
                            },
                            title: "取消"
                        },
                        button_info2: {
                            highlight: "1",
                            fn: function() {
                                var t = {
                                    deleteList: !y(".js_player_delete").parents("span.form_check__checkbox").hasClass("form_check__checkbox--check"),
                                    mod: parseInt(y(".js_player_mods").parents("span.form_radio__radiobox--check").data("mod"))
                                };
                                m.player.setPlayerOptions(t),
                                n.hide()
                            },
                            title: "确定"
                        }
                    })
                }),
                p.pgvClickStat("y_new.player.options")
            }).on("click", ".js_player_delete",
            function() {
                var n = y(this).parents("span.form_check__checkbox");
                n.hasClass("form_check__checkbox--check") ? (n.removeClass("form_check__checkbox--check"), n.removeClass("sprite")) : (n.addClass("form_check__checkbox--check"), n.addClass("sprite")),
                n.hasClass("form_check__checkbox--check") ? p.pgvClickStat("y_new.player.options.notdelete") : p.pgvClickStat("y_new.player.options.delete")
            }).on("click", ".js_player_mods",
            function() {
                var n = y(this).parents("span.form_radio__radiobox");
                y(".js_player_mods").parents("span.form_radio__radiobox").removeClass("form_radio__radiobox--check"),
                n.addClass("form_radio__radiobox--check"),
                p.pgvClickStat("y_new.player.options.playmod" + y(".js_player_mods").parents("span.form_radio__radiobox").data("mod"))
            }),
            y(window).resize(function() {
                h.webkit && y(".sb_overview").css({
                    height: y(".player__bd").height() - 56
                })
            }),
            y(document).on("keydown", "",
            function(n) {
                switch (n.keyCode) {
                case 32:
                case 19:
                    D = !1,
                    y("#btnplay").click();
                    break;
                case 37:
                    n.altKey ? y(".btn_big_prev").click() : n.ctrlKey && L.update(P.pos - 5);
                    break;
                case 39:
                    n.altKey ? y(".btn_big_next").click() : n.ctrlKey && L.update(P.pos + 5);
                    break;
                case 38:
                    n.altKey && q.incVol();
                    break;
                case 40:
                    n.altKey && q.decVol();
                    break;
                case 67:
                    y("#simp_btn").click();
                    break;
                case 77:
                    y("#spanmute").click();
                    break;
                case 79:
                    y("#play_mod").click();
                    break;
                case 86:
                    y(".js_btn_fav").click();
                    break;
                case 68:
                    y(".js_btn_down").click()
                }
            });
            var i = "",
            r = null;
            y(document).on("mousedown", ".songlist__list li",
            function(n) {
                var t = m.util.getTarget(n),
                e = this;
                if (y(t).parents("a").length > 0 || y(t).parents(".songlist__edit").length > 0) return ! 1;
                r = setTimeout(function() {
                    y(".songlist__end,.songlist__drag").remove(),
                    y(e).before('<li class="songlist__end"></li>'),
                    y("#song_box").prepend('<li class="songlist__drag"></li>'),
                    a(n),
                    y(e).addClass("songlist__item--drag"),
                    i = y("li.songlist__item--drag")[0].outerHTML.replace("songlist__item--drag", ""),
                    p.pgvClickStat("y_new.player.drag")
                },
                300);
                var s = "";
                y(document).off("mousemove").on("mousemove", ".songlist__list li",
                function(n) {
                    m.util.getTarget(n);
                    if (y(".songlist__item--drag").length > 0) {
                        var t = y(this).attr("mid"),
                        e = y(this).attr("ix");
                        if (s != t) {
                            var o = parseInt(parseInt(y(".sb_scrollable").css("height")) / 50) - 2;
                            0 == y(".songlist__drag").length ? (y(".songlist__end,.songlist__drag").remove(), y('.songlist__list li[mid="' + t + '"]').before('<li class="songlist__end"></li>'), y("#song_box").prepend('<li class="songlist__drag"></li>')) : (y(".songlist__end").remove(), y('.songlist__list li[mid="' + t + '"]').before('<li class="songlist__end"></li>')),
                            a(n),
                            !h.webkit && k && k.scrollbar("scrollToY", 50 * (e - o)),
                            h.webkit && (y(".sb_overview")[0].scrollTop = 50 * (e - o))
                        }
                    }
                    return ! 1
                })
            }).on("mouseup", ".songlist__list li",
            function(n) {
                r && (clearTimeout(r), r = null);
                var e = m.util.getTarget(n);
                return y(e).parents("a").length > 0 || y(e).parents(".songlist__edit").length > 0 ? !1 : (y(".songlist__end,.songlist__drag").remove(), !y(this).hasClass("songlist__item--drag") && i ? (y("li.songlist__item--drag").remove(), y(this).before(i), i = "", t()) : y("li.songlist__item--drag").removeClass("songlist__item--drag"), y(document).off("mousemove"), !1)
            }).on("mouseup", "",
            function() {
                y(".songlist__end,.songlist__drag").remove(),
                setTimeout(function() {
                    y("li.songlist__item--drag").removeClass("songlist__item--drag")
                },
                300),
                y(document).off("mousemove")
            })
        },
        play: M.play
    };
    return A
});