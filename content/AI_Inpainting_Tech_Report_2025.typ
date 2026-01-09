// ==========================================
// 1. 全局配置与工具函数定义
// ==========================================

// 字体配置
#let font-serif = ("Times New Roman", "SimSun")
#let font-sans = ("Times New Roman", "Arial")
#let font-mono = "Consolas"

// 自定义色板
#let c-primary = rgb("#0f172a")
#let c-accent = rgb("#0369a1")
#let c-tier1 = rgb("#e0f2fe")
#let c-tier2 = rgb("#f3e8ff")
#let c-tier3 = rgb("#ccfbf1")
#let c-text-light = rgb("#64748b")

// 页面设置
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1 / 1",
  header: align(right)[
    #set text(font: font-sans, size: 8pt, lang: "en", fill: c-text-light)
    AI 图像魔法消除技术选型报告 (2025 Edition)
    #v(-5pt)
    #line(length: 100%, stroke: 0.5pt + c-text-light)
  ],
)

// 正文排版设置
#set text(font: font-serif, size: 10.5pt, lang: "zh", fill: c-primary)
#set par(justify: true, leading: 0.8em)
#show link: it => underline(text(fill: c-accent, it))

// 标题样式
#show heading.where(level: 1): it => block(above: 2em, below: 1em)[
  #set text(font: font-sans, weight: "bold", size: 16pt, fill: c-accent)
  #box(width: 4pt, height: 1em, fill: c-accent) #h(5pt) #it.body
]

#show heading.where(level: 2): it => block(above: 1.5em, below: 0.8em)[
  #set text(font: font-sans, weight: "bold", size: 13pt, fill: c-primary)
  #it
]

// 工具函数：彩色胶囊标签
#let badge(content, fill-color) = box(
  fill: fill-color,
  inset: (x: 6pt, y: 2pt),
  radius: 4pt,
  stroke: none,
  text(size: 8pt, weight: "bold", fill: black.lighten(20%), font: font-sans, content),
)

// 工具函数：信息卡片
#let info-card(title, body, color-theme) = block(
  fill: color-theme,
  inset: 12pt,
  radius: 6pt,
  stroke: (left: 4pt + color-theme.darken(40%)),
  width: 100%,
  breakable: false,
  [
    #text(font: font-sans, weight: "bold", size: 11pt, fill: c-primary, title)
    #v(0.5em)
    #text(size: 10pt, body)
  ],
)

// ==========================================
// 2. 文档正文开始
// ==========================================

#align(center)[
  #text(font: font-sans, size: 22pt, weight: "black", fill: c-primary)[
    AI 图像魔法消除技术选型报告
  ]
  #v(0.5em)
  #text(font: font-sans, size: 12pt, fill: c-text-light)[
    2025 严选版 | 深度工程化
  ]
  #v(1em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align(right)[*版本日期*: 2026年1月], align(left)[*核心议题*: 自动删除特定对象工程路径],
  )
]

#line(length: 100%, stroke: 1pt + c-primary)
#v(1em)

= 1. 核心选型总览：三大技术代际

目前的 AI 消除技术已形成清晰的梯队。对于工业落地，建议采用 *混合架构*，而非押注单一模型。

#table(
  columns: (18%, 22%, 25%, 35%),
  inset: 10pt,
  align: horizon,
  stroke: 0.5pt + gray.lighten(50%),
  fill: (_, row) => if row == 0 { c-primary } else { white },

  // 表头
  table.header(
    ..([*技术代际*], [*代表模型*], [*核心优势*], [*适用场景*]).map(it => text(
      fill: white,
      weight: "bold",
      font: font-sans,
      it,
    )),
  ),

  // 第一行：修复 sym.bolt -> emoji.zap
  table.cell(fill: c-tier1)[
    *第一代*\ 工程实用型
  ],
  [
    *IOPaint*\ (LaMa / MAT)
  ],
  [
    #emoji.lightning 速度极快 (ms级)\
    #emoji.package 部署最简\
    #emoji.arrow.b.filled 显存 < 4GB
  ],
  [
    后台批量清洗数据\
    背景简单的文档消除\
    实时性要求高的业务
  ],

  // 第二行：修复 sym.brain -> emoji.brain
  table.cell(fill: c-tier2)[
    *第二代*\ 视觉极致型
  ],
  [
    *PowerPaint*\ *MagicEraser*
  ],
  [
    #emoji.star 画质 SOTA\
    #emoji.brain 语义感知强\
    #emoji.sparkles 无伪影
  ],
  [
    设计师 / 精修工具\
    复杂纹理 (木纹/地毯)\
    高保真印刷品处理
  ],

  // 第三行：修复 sym.robot -> emoji.robot
  table.cell(fill: c-tier3)[
    *第三代*\ 智能交互型
  ],
  [
    *BrushEdit*\ *BrushNet*
  ],
  [
    #emoji.bubble.speech.r 听懂自然语言\
    #emoji.robot 全自动流程\
    #emoji.baby 交互门槛零
  ],
  [
    C端智能助手\
    非专业用户\
    复杂指令操作
  ],
)

= 2. 深度解析：2024-2025 重点模型测评

以下模型均已通过代码仓库或论文验证，解决了传统技术的长期痛点。

#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,

  info-card(
    "MagicEraser (华为诺亚)",
    [
      *核心标签*: #badge("拒绝伪影", c-tier2) #badge("语义控制", c-tier2)

      *解决痛点*: 传统模型在擦除物体后，边缘往往会有模糊或纹理断裂。

      *技术突破*: 引入 *语义感知注意力重聚焦*。在生成背景时，强制模型关注周围环境（如“这是木头桌子”），生成连贯纹理。

      *推荐场景*: 实木办公桌、地毯等复杂背景。
    ],
    c-tier2,
  ),

  info-card(
    "BrushEdit (腾讯 ARC)",
    [
      *核心标签*: #badge("全能指挥官", c-tier3) #badge("Agent工作流", c-tier3)

      *解决痛点*: 解决了“不仅要擦除，还要理解擦什么”的问题。

      *工作流*: 自然语言指令 $arrow$ MLLM分析 $arrow$ 检测/分割 $arrow$ BrushNet修复。

      *价值*: 它是 *Agent（智能体）工作流* 的标准范式。
    ],
    c-tier3,
  ),
)

#v(10pt)
#info-card(
  "PowerPaint (OpenMMLab)",
  [
    *核心标签*: #badge("任务提示专家", rgb("#fee2e2"))

    *技术突破*: 训练了特定的任务 Token（如 `[remove]`, `[fill]`）。这使得模型能明确区分“消除”和“替换”任务，避免了传统 Inpainting 模型经常“胡乱加戏”（Hallucination）的问题。
  ],
  rgb("#fff1f2"),
)

= 3. 全维度性能对比矩阵

基于 *DocRemoval-2K* 数据集（模拟办公文档消除场景）的预估指标：

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    inset: 8pt,
    align: center + horizon,
    stroke: none,
    fill: (_, row) => if calc.odd(row) { rgb("#f1f5f9") } else { white },

    table.header(
      ..([维度], [IOPaint (MAT)], [PowerPaint], [MagicEraser], [BrushEdit]).map(it => text(
        weight: "bold",
        font: font-sans,
        fill: c-primary,
        it,
      )),
    ),

    table.hline(stroke: 1pt + c-primary),

    // 修复 sym.rocket -> emoji.rocket
    [处理速度], [#text(fill: c-accent)[#emoji.rocket 极快 (0.5s)]], [🐢 中等 (4s)], [🐢 中等 (5s)], [🐌 极慢 (15s+)],
    [背景还原], [⭐⭐⭐], [⭐⭐⭐⭐], [⭐⭐⭐⭐⭐], [⭐⭐⭐⭐],
    [交互方式], [Mask (点选)], [Mask + 提示词], [Mask (语义优化)], [*纯自然语言*],
    [显存需求], [Low (4GB)], [High (12GB)], [High (12GB)], [Very High],
    [部署难度], [✅ 一键安装], [⚠️ 需配置SD], [⚠️ 需特定环境], [⛔ 复杂(含LLM)],
    table.hline(stroke: 0.5pt + gray),
    [*选型建议*],
    [#badge("工程首选", c-tier1)],
    [#badge("精修备选", white)],
    [#badge("质感首选", c-tier2)],
    [#badge("交互首选", c-tier3)],
  ),
  caption: [各主流模型性能对比矩阵],
)

= 4. 推荐落地架构：三级分层策略

为了平衡成本与体验，建议采用 *"三级漏斗" (Three-Layer Funnel)* 架构。

#let layer-box(title, engine, logic, color) = block(
  fill: white,
  stroke: (left: 4pt + color),
  inset: (left: 1em),
  width: 100%,
  [
    #text(font: font-sans, weight: "bold", fill: color)[#title]
    #h(1fr)
    #text(size: 9pt, fill: gray)[核心引擎: #engine]
    #v(0.5em)
    #list(marker: [--], ..logic)
  ],
)

#stack(
  dir: ttb,
  spacing: 1em,
  layer-box(
    "第一层：快速响应层 (Fast Layer)",
    "IOPaint (LaMa/MAT) + PaddleOCR",
    ("系统自动检测“文件/纸张”。", "若背景简单，直接调用 LaMa 毫秒级消除。", "解决 80% 需求。"),
    c-accent,
  ),
  layer-box(
    "第二层：精细修复层 (Detail Layer)",
    "PowerPaint / MagicEraser",
    ("若第一层效果不佳（用户点击重试）。", "若检测到背景纹理极其复杂。", "降级调用扩散模型进行高质量修复。"),
    rgb("#8b5cf6"),
  ),
  layer-box(
    "第三层：智能交互层 (Agent Layer)",
    "BrushEdit (MLLM Agent)",
    ("针对 VIP 用户入口。", "处理复杂语义指令（如保留印章删除文字）。"),
    rgb("#10b981"),
  ),
)




= 5. 参考文献与资源清单 (References)

// 定义单行流式排版 (One-line Flow Layout)
#let bib-entry(index, title, venue, url, tag: none) = grid(
  columns: (2.5em, 1fr),
  // 左侧序号固定宽度，右侧自适应
  gutter: 0.8em,

  // 1. 左侧：序号 [1]
  align(right)[
    #text(weight: "bold", fill: c-accent, font: font-sans)[\[#index\]]
  ],

  // 2. 右侧：所有内容在同一行流动
  align(left)[
    // 标题 (加粗)
    #text(fill: c-primary)[#title]
    // 分隔符 (逗号)
    #text(fill: c-text-light)[, ]
    // 出处 (斜体)
    #text(style: "italic", fill: c-text-light)[#venue]
    // 分隔符 (句号)
    #text(fill: c-text-light)[. ]
    // 标签 (如果有，显示为内联小盒子)
    #if tag != none [
      #box(
        baseline: 20%, // 调整垂直对齐，让它不歪
        fill: rgb("#f1f5f9"),
        inset: (x: 4pt, y: 0pt),
        radius: 3pt,
        stroke: 0.5pt + rgb("#cbd5e1"),
        text(size: 7pt, fill: c-primary.lighten(30%), weight: "bold", font: font-sans)[#tag],
      )
      #h(0.5em) // 标签后的间距
    ]
    // 链接
    #link(url)[#text(font: font-mono, size: 9pt, fill: c-accent)[#url]]
  ],
)

// 渲染列表 (单栏，大气，清晰)
#bib-entry(
  1,
  "IOPaint (原 Lama Cleaner)",
  "GitHub Repository",
  "https://github.com/Sanster/IOPaint",
  tag: "工程落地首选",
)

#bib-entry(2, "LaMa: Resolution-robust Large Mask Inpainting", "WACV 2022", "https://github.com/advimman/lama")

#bib-entry(3, "MAT: Mask-Aware Transformer", "CVPR 2022", "https://github.com/fenglinglwb/MAT")

#bib-entry(4, "PowerPaint: A Task is Worth One Word", "arXiv:2312.03594", "https://github.com/open-mmlab/PowerPaint")

#bib-entry(5, "MagicEraser: Semantics-Aware Control", "arXiv:2410.10207", "Paper Only", tag: "SOTA 2025")

#bib-entry(6, "BrushEdit: All-In-One Image Inpainting", "arXiv:2412.01547", "https://github.com/TencentARC/BrushEdit")

#bib-entry(7, "BrushNet: Dual-Branch Diffusion", "ECCV 2024", "https://github.com/TencentARC/BrushNet")

#v(2em)

// 结论块：保持宽度，增加一点底色衬托，像论文的结论章节
#block(
  fill: c-tier1.lighten(50%), // 极淡的蓝色背景
  stroke: (left: 4pt + c-accent),
  inset: 1.5em,
  width: 100%,
  radius: 0pt, // 矩形更显正式
  [
    #set align(left)
    #text(weight: "bold", size: 11pt, fill: c-primary, font: font-sans)[💡 最终实施建议 (Conclusion)]
    #v(0.5em)
    #text(size: 10.5pt)[
      请以 #text(weight: "bold", fill: c-primary)[IOPaint (MAT)] 为主劳动力处理批量任务（覆盖 80% 需求）；
      引入 #text(weight: "bold", fill: c-accent)[PowerPaint] 解决复杂背景的“钉子户”；
      并持续关注 #text(weight: "bold", fill: rgb("#059669"))[BrushEdit] 以备未来的自然语言交互变革。
    ]
  ],
)

#v(1em) // 两个块之间增加一点间距

#block(
  fill: rgb("#fffbeb"), // 极淡的琥珀色背景
  stroke: (left: 4pt + rgb("#d97706")), // 深琥珀色左边框
  inset: 1.5em,
  width: 100%,
  radius: 4pt,
  [
    #set align(left)
    // 标题：使用较深的橙褐色，增加警示/注意感
    #text(weight: "bold", size: 11pt, fill: rgb("#b45309"), font: font-sans)[📅 下一步行动与关注列表 (To-Do List)]

    #v(0.5em)
    #set text(size: 10pt)

    // 使用列表让条目更清晰
    #list(
      marker: text(fill: rgb("#d97706"))[•], // 自定义列表符号颜色
      spacing: 0.8em,

      [
        *持续追踪 (Paper Tracking)*:\
        密切关注 *CVPR/ICCV 2025* 中关于 _"Text-Guided Inpainting"_ 的最新工作，重点寻找能替代 SAM 的端到端（End-to-End）自动分割消除方案。
      ],

      [
        *工程优化 (Engineering)*:\
        尝试将 *MagicEraser* 模型导出为 *TensorRT* 或 *ONNX* 格式，目标是将单图推理延迟压缩至 1s 以内，以便部署于边缘端节点。
      ],

      [
        *数据建设 (Dataset)*:\
        收集并标注 500 张真实业务场景下的“复杂背景文档”图片（含褶皱、阴影、印章重叠），用于微调 *PowerPaint* 以提升特定场景的鲁棒性。
      ],
    )
  ],
)

// -- References for Emoji Symbols:
// https://typst.app/docs/reference/symbols/emoji/
// -- References for Typst Symbols:
// https://typst.app/docs/reference/symbols/
