local a,b,c,d,e,f,g,h,i,j,k,l,m,n,o="MineOS EFI","Internet recovery","Change label","key_down","/init.lua","filesystem",component.proxy,component.list,computer.pullSignal,computer.uptime,table.insert,math.max,math.min,math.huge,math.floor;local p,q,r,s,t,u,v,w=1,0,1,1,0,g(h("eeprom")()),g(h("gpu")()),h("internet")()v.bind(h("screen")(),true)local x,z,A,B,C,D,E,F,G,H,I=computer.shutdown,v.set,v.fill,u.setData,u.getData,v.getDepth(),v.getResolution()computer.getBootAddress,computer.setBootAddress=C,B;if D==4 then p,q,r,s,t=0x333333,0xFFFFFF,0x333333,0x333333,0xFFFFFF elseif D==8 then p,q,r,s,t=0x2D2D2D,0xE1E1E1,0x878787,0x878787,0xE1E1E1 end;local J,K,L=function(M)if M~=G then v.setBackground(M)G=M end end,function(M)if M~=H then v.setForeground(M)H=M end end,function(N,O,P)if#N<O then N=N..string.rep(" ",O-#N)else N=N:sub(1,O)end;return N..(P and""or"  ")end;local Q,R,S=function(T,y,U,V,M)J(M)A(T,y,U,V," ")end,function(y,W,N)local T=o(E/2-#N/2)K(W)z(T,y,N)end,function(N,X,Y)return{s=N,c=X,b=Y}end;local function Z(_,a0)y=o(F/2-_/2)Q(1,1,E,F,q)R(y,p,a0)return y+2 end;local function a1(a0,a2,a3)local a4={}for a5 in a2:gmatch("[^\r\n]+")do a4[#a4+1]=a5:gsub("\t","  ")end;local y=Z(#a4,a0)for a6=1,#a4 do R(y,r,a4[a6])y=y+1 end;if a3 then repeat a3=i()until a3==d or a3=="touch"end end;local a7,a8,a9,aa,ab=function(ac)a1(a,"Booting from "..ac.address)local ad,ae,af,ag,ah="","",ac.open(e,"r")while ae do ad,ae=ad..ae,ac.read(af,n)end;ac.close(af)ag,ah=load(ad,"="..e)if ag then ag,ah=pcall(ag)if ag then return end end;a1(a,ah,1)end,function()return S("Back",I,1)end,function(a0,ai)local aj,ak,al=2,1,0;for a6=1,#ai do al=math.max(al,#ai[a6].s)end;while 1 do local y,T,am=Z(#ai+2,a0)for a6=1,#ai do T=o(E/2-#ai[a6].s/2)if a6==ak then Q(o(E/2-al/2)-2,y,al+4,1,s)K(t)z(T,y,ai[a6].s)else J(q)K(r)z(T,y,ai[a6].s)end;y=y+1 end;am={i()}if am[1]==d then if am[4]==200 and ak>1 then ak=ak-1 elseif am[4]==208 and ak<#ai then ak=ak+1 elseif am[4]==28 then if ai[ak].c then ai[ak].c()end;if ai[ak].b then return end end end end end,function(y,an)local N,ao,ap,am,aq="",true;while 1 do ap=an..N;A(1,y,E,1," ")gpuSetForeground(r)z(o(E/2-#ap/2),y,ap..(ao and"█"or""))am={i(0.5)}if am[1]==d then if am[4]==28 then return N elseif am[4]==14 then N=N:sub(1,-2)else aq=unicode.char(am[3])if aq:match("^[%w%d%p%s]+")then N=N..aq end end;ao=true elseif am[1]=="clipboard"then N=N..am[3]elseif not am[1]then ao=not ao end end end,function(ar)local as,ad,af,at,ah=function(N)a1(b,"Internet boot failed: "..N,1)end,"",g(w).request(ar)if af then a1(b,"Downloading script...")while 1 do at,ah=af.read(n)if at then ad=ad..at else af:close()if ah then as(ah)else at,ah=load(ad)if at then B("#"..ar)at,ah=pcall(at)if at then return else as(ah)end else as(ah)end end;break end end else as("invalid URL-address")end end;a1(a,"Hold Alt to show boot options menu")local au,am=j()+1;while j()<au do am={i(au-j())}if am[1]==d and am[4]==56 then local av={S("Disk management",function()local aw,ax={a8()},C()for ay in h(f)do local ac=g(ay)local az,aA=ac.getLabel()or"Unnamed",ac.isReadOnly()k(aw,1,S((ay==ax and"> "or"  ")..L(az,10)..L(ac.spaceTotal()>1048576 and"HDD"or ac.spaceTotal()>65536 and"FDD"or"SYS",3)..L(aA and"R"or"R/W",3)..ay:sub(1,8).."  "..L(string.format("%.2f",ac.spaceUsed()/ac.spaceTotal()*100).."%",6,1),function()local aB={a8()}if not aA then k(aB,1,S(c,function()ac.setLabel(aa(Z(2,c),"Enter new name: "))end,1))k(aB,2,S("Format",function()a1(a,"Formatting filesystem "..ay)for aC,aD in ipairs(ac.list("/"))do ac.remove(aD)end;a1(a,"Formatting finished",1)end,1))end;k(aB,1,S("Set as startup",function()B(ay)end,1))a9(az.." ("..ay..")",aB)end,1))end;a9("Select filesystem",aw)end),S("Shutdown",function()x()end),a8()}if w then k(av,2,S(b,function()ab(aa(Z(2,b),"Enter URL: "))end))end;a9(a,av)end end;local ad,ac=C()if ad:sub(1,1)=="#"then ab(ad:sub(2,-1))else ac=g(ad)if ac and ac.exists(e)then a7(ac)else for ay in h(f)do ac=g(ay)if ac.exists(e)then B(ay)a7(ac)break else ac=nil end end;if not ac then a1(a,"No bootable mediums found",1)end end end;x()