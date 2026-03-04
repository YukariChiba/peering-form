#import "template.typ": *

#set document(title: [Telephony Peering Request])

#set page(
  paper: "a4",
  margin: (x: 0.8cm, y: 0.8cm, top: 3cm),
  header: context[
    #grid(
      columns: (1fr, auto, 1fr),
      align: (left, center, right),
      [[Page #counter(page).display()]], title(), [( Version #version )],
    )
    #align(center)[Only used for *#ownas.join("/")*]
  ],
  background: [
    #if preview [
      #rotate(24deg,[
        #text(128pt, fill: rgb("CCCCCC"))[*PREVIEW*]
        #text(48pt, fill: rgb("CCCCCC"))[*Not For Production*]
      ])
    ]
  ]
)

#set text(font: globalfont, size: textnormal, lang: "en")

#section-header("System & Numbering")
#titleframe(
  title: "Telephony System",
  subtitle: "(If you need to select both, please submit two forms)",
)[
  #grid(
    columns: (2fr, 1fr),
    check[*Telephony42* (DN42 / NeoNetwork / ICVPN / ChaosVPN / CRXN)], check[*ITU-T* (currently NOT supported)],
  )
]

#titleframe(
  title: "Numbering Plan",
  subtitle: "(Non-standard numbering plan requires justification)",
)[
  #grid(
    columns: 1fr,
    gutter: linegutter,
    check[*Telephony42 Standard Draft* (e.g., 424 + Network ID + ASN Last 4 digits)],
    check[*Others / Custom Plan*: #underline-field()],
  )
]

#text(weight: "bold")[Fill Your Prefix(es)]
#grid(
  columns: (auto),
  gutter: linegutter,
  align: horizon,
  grid(
    columns: (auto, auto),
    gutter: linegutter,
    align: horizon,
    char-box(14, size: charboxlarge, border: heavyborder), text(size: 12pt)[\+ Your Extensions]
  ),
  align(left + horizon, check[Tick if E.164 is configured for your prefix(es) (currently NOT supported in Telephony42, see DN42 maillist for details)]),
  [#text(size: textsmall)[Additional Prefixes (if any):] #underline-field()]
)

#section-header("Peer Target")
#frame(stroke: heavyborder)[
  #grid(
    columns: (1fr, 1fr),
    row-gutter: linegutter,
    ..ownprefix.map(v => 
      stack(
        spacing: linegutter,
        check[*#v.title*],
        pad(left: 15pt, text(size: textnormal)[Prefixes: #v.prefixes.map(vv => str(vv)).join(", ")])
      )
    )
  )
]

#section-header("Connection & Transport")
#titleframe(title: "Connection Medium")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: linegutter,
    check[*Virtual* (SIP Trunk)],
    check[*Virtual* (IAX2 Trunk)],
    check[*Physical* (E1 / T1 / ISDN)],
    check[*Physical* (FXS / FXO)],
    check[*Other*: #underline-field()],
  )
  #grid(
    columns: (1fr, 1fr),
    row-gutter: linegutter,
    column-gutter: linegutter,
    stack(
      spacing: linegutter,
      [*SIP Signaling Transport:* (optional)],
      grid(
        columns: (auto, auto, auto),
        gutter: linegutter,
        check[UDP], check[TCP], check[TLS (Secure SIP)],
      )
    ),
    stack(
      spacing: linegutter,
      [*Media Transport & NAT:* (optional)],
      grid(
        columns: (auto, auto, auto),
        gutter: linegutter,
        check[RTP], check[SRTP], check[Symmetric RTP],
      )
    )
  )
]

#titleframe(title: "VoIP Endpoint Options", subtitle: "(For Virtual Connections)")[
  #grid(
    columns: (auto, 1fr, auto, auto),
    gutter: linegutter,
    align: horizon,[Primary Endpoint (IP/Domain): #underline-field() : #char-box(5)],
    h(5pt),
    check[Prefer IPv6],
    check[Prefer IPv4],
  )
  #grid(
    columns: (auto, 1fr, auto, auto),
    gutter: linegutter,
    align: horizon,[Secondary/Failover (Optional): #underline-field() : #char-box(5)],
    h(5pt),
    check[Prefer IPv6],
    check[Prefer IPv4],
  )

  #v(textnormal)

  #grid(
    columns: (auto, auto, auto, 1fr),
    gutter: linegutter,
    align: horizon,
    [Peering Model:],
    check[Peer-to-Peer (No Registration)],
    check[We register to you],
    check[You register to us],
  )

  #grid(
    columns: (auto, auto, auto),
    gutter: linegutter,
    align: horizon,
    [Authentication:],
    check[IP-based (Static IP / ACL / Firewall)],
    check[Digest / Password Authentication],
  )

  #grid(
    columns: (auto, 1fr),
    gutter: linegutter,
    [Credentials (if Digest):],[User: #underline-field(width: 30%) #h(10pt) Password: #underline-field(width: 30%) #text(size: textexsmall)[(Or via secure channel)]]
  )
]

#titleframe(title: "Capabilities & Media", subtitle: "(Optional but recommended)")[
  #grid(
    columns: (auto, 1fr),
    row-gutter: linegutter,
    column-gutter: linegutter,
    align: (left + horizon),

    [Audio Codecs:],
    grid(
      columns: (auto, auto, auto, auto, auto, 1fr),
      gutter: linegutter,
      check[G.711 (alaw/ulaw)], check[G.722], check[G.729], check[Opus], check[Speex], check[GSM],
    ),[],
    grid(
      columns: (auto, auto, auto, auto, 1fr),
      gutter: linegutter,
      check[AMR / AMR-WB], check[iLBC], check[SLIN], check[Others: #underline-field()],
    ),
    
    [Video Codecs:],
    grid(
      columns: (auto, auto, auto, auto, 1fr),
      gutter: linegutter,
      check[H.264], check[VP8], check[H.263], check[None], check[Others: #underline-field()],
    ),[DTMF Mode:],
    grid(
      columns: (auto, auto, auto, 1fr),
      gutter: linegutter,
      check[RFC 2833 / 4733], check[SIP INFO], check[In-band],
    ),

    [Fax / Modem:],
    grid(
      columns: (auto, auto, 1fr),
      gutter: linegutter,
      check[T.38 Passthrough], check[G.711 Fallback],
    ),[Capacity Limits:],
    grid(
      columns: (auto, auto, auto, 1fr),
      gutter: linegutter,
      align: bottom,
      [Max Channels:],[#underline-field(width: 50pt) #text(size: textexsmall)[(Leave blank if unlimited)]],
      [Max Calls Per Sec (CPS):],[#underline-field(width: 50pt) #text(size: textexsmall)[(Leave blank if unknown)]],
    ),
    [Test Number:],[#char-box(14) #text(size: textexsmall)[(Echo test, IVR, or Music on Hold)]]
  )
]

#section-header("Contacts")
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  stroke: heavyborder,
  inset: tableinset,
  [*Email Address:* (required)],[],
  [*#check[Telephone]*],
  [],
  [*#check[Instant Messaging]*],[],
  [*#check[Other: #underline-field()]*],[],
)

#section-header("Confirmation")
#frame[
  #text[(You *must* read, acknowledge and tick *ALL* the items)] \
  #text(size: textsmall)[
    #check[I have confirmed that I have the right to manage the above mentioned PBX/VoIP resources and that the above information has been *filled in correctly*.] \
    #check[I am aware that this connection is based on the *Best Effort principle* and *does NOT guarantee audio quality and availability*, and that I will *be responsible for any consequence* caused by the failure of this connection.] \
    #check[I will strictly comply with *Anti-Fraud and Anti-Harassment (Anti-SPIT/SPAM)* policies. I will *NOT* originate, transmit, or facilitate any illegal, fraudulent, or unsolicited automated communications (e.g., robocalls) over this connection.]
  ]
  #v(linegutter)
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[Signature:],
    v(60pt),[
      #set align(right)
      Date of Request:
      #h(linegutter)
      #date-box()
    ],
  )
]

#section-header("Result (This field is to be completed by the reviewer)")

#frame[
  #grid(
    columns: (1fr, 1fr, 1fr),
    text(weight: "bold")[#check[Peering Accepted]],
    text(weight: "bold")[#check[Peering Onhold]],
    text(weight: "bold")[#check[Peering Rejected]],
  )
  #line(length: 100%, stroke: lightborder)
  *Extra Message:*
  #v(60pt)
  #align(right)[
    Date of Reply:
    #h(linegutter)
    #date-box()
  ]
]

#footer

#place(
  bottom + center,
  text(size: textsmall, weight: "bold")[ [End of Document] ]
)
