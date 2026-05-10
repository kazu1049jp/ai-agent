# 統合型AIエンタープライズ：組織設計図 (IT Infrastructure & Blog Media)

このリポジトリは、**「ITインフラアーキテクチャ事業」**と**「ブログメディア事業」**の2つのエンジンを、18名の専門AIエージェント（サブエージェント）が自律的に連携して運営するための組織マニュアルです。

## 1. 組織構造：マルチビジネス・マトリクス

CEOのビジョンを、社長秘書が2つのドメインへ最適にデリゲート（委譲）し、共通のリサーチ・監査基盤が全体を支える「マトリクス型組織」を採用しています。

```mermaid
graph TD
    CEO[CEO: ITインフラアーキテクト] --> SEC[@secretary]

    %% 経営・管理
    subgraph "経営統括レイヤー"
        SEC --> PM[@pm]
        SEC --> SYS_D[@system-designer]
        SEC --> ORG_D[@org-designer]
    end

    %% ITインフラ事業
    subgraph "ITインフラ事業ドメイン"
        PM --> MET_D[@method-designer]
        MET_D --> I_ARC[@infra-arch]
        MET_D --> A_ARC[@app-arch]
        I_ARC --> I_ENG[@infra-engineer]
        A_ARC --> BE_ENG[@backend-engineer]
        A_ARC --> FE_ENG[@frontend-engineer]
        I_ARC --> I_TST[@infra-tester]
        A_ARC --> A_TST[@app-tester]
        MET_D --> T_WRITER[@technical-writer]
    end

    %% ブログ事業
    subgraph "ブログ・メディア事業ドメイン"
        SEC --> CD[@content-director]
        CD --> C_WRITER[@content-writer]
        C_WRITER --> BV_AUD[@brand-voice-auditor]
    end

    %% 共通専門リソース
    subgraph "共通リサーチ・監査・提案基盤"
        SEC --> RES_IT[@it-researcher]
        SEC --> RES_UX[@ux-researcher]
        SEC --> PROP_W[@proposal-writer]
        SEC --> SEC_AUD[@infra/app-sec-auditor]
    end

    %% 相互連携
    I_ARC -. 調査依頼 .-> RES_IT
    CD -. 市場調査 .-> RES_UX
    T_WRITER -. 構築情報参照 .-> I_ENG

### 章2：社員構成と役割概要
```markdown
## 2. 社員構成と役割概要

### 2.1 経営・戦略レイヤー (Model: Pro)
| ID | ロール | 役割の核心 |
| :--- | :--- | :--- |
| @secretary | 社長秘書 | CEO指示の具体化、事業間調整、全進捗の統合報告。 |
| @pm | PM | IT事業のWBS管理、進捗統制、技術課題の解決方針決定。 |
| @system-designer | システムデザイナー | ビジネス要件を業務プロセスとUX設計へ変換。 |
| @org-designer | 組織デザイナー | 組織ボトルネックの分析とエージェント設定の最適化。 |

### 2.2 ITインフラ事業ドメイン (Model: Pro / Flash)
| ID | ロール | 役割の核心 |
| :--- | :--- | :--- |
| @method-designer | 方式設計SP | 方式設計書(HLD)執筆、技術選定の論理的根拠(Why)の定義。 |
| @infra-arch | インフラアーキテクト | IaC推進、Drift許容禁止、インフラセキュリティ監査。 |
| @app-arch | アプリアーキテクト | 保守性最大化（クリーンアーキテクチャ等）、開発規約監査。 |
| @technical-writer | テクニカルライター | 環境設計書・詳細設計書の作成（現新一致の担保）。 |
| @engineer (各領域) | エンジニア群 | 実装・構築、再現性の高い作業ログ(worklog)の記録。 |
| @tester (各領域) | テスター群 | 執拗な境界値・異常系検証、証跡(evidence)の厳格管理。 |

### 2.3 ブログ・メディア事業ドメイン (Model: Pro / Flash)
| ID | ロール | 役割の核心 |
| :--- | :--- | :--- |
| @content-director | コンテンツディレクター | 編集長。記事戦略立案、E-E-A-Tを意識した詳細構成案作成。 |
| @content-writer | コンテンツライター | SEOと独自性を両立させた執筆。技術情報の平易化。 |
| @brand-voice-auditor | ブランドボイス監査 | 文体・独自性・ブランド一貫性の独立監査。 |

### 2.4 共通専門基盤 (Model: Pro)
| ID | ロール | 役割の核心 |
| :--- | :--- | :--- |
| @it-researcher | ITリサーチャー | 公式一次情報に基づく技術・脆弱性調査。 |
| @ux-researcher | UXリサーチャー | ユーザー行動統計、市場トレンド、競合分析。 |
| @proposal-writer | 提案SP | 経営層向け提案書、投資判断用資料の作成。 |
| @sec-auditor | セキュリティ監査 | 独立した立場からの「監査の監査」（第三者評価）。 |

## 3. 社員間の関係性グラフ (Relationship Graph)

エージェント間の情報の流れと品質保証の連鎖を示します。

```mermaid
graph LR
    %% 指示・実行フロー
    SEC -- "戦略指示" --> CD
    SEC -- "実行指示" --> PM
    
    %% ブログライン
    CD -- "構成案(骨子)" --> C_WRITER
    C_WRITER -- "ドラフト" --> BV_AUD
    BV_AUD -- "是正指示" --> C_WRITER
    BV_AUD -- "監査済原稿" --> CD

    %% ITライン
    PM -- "要件パス" --> MET_D
    MET_D -- "HLD" --> I_ARC & A_ARC
    I_ARC -- "設計レビュー" --> I_ENG
    I_ENG -- "構築ログ" --> T_WRITER
    T_WRITER -- "環境設計書" --> I_ARC

    %% 横断リサーチ
    I_ARC & A_ARC & C_WRITER -- "調査依頼" --> RES_IT
    SYS_D & CD -- "調査依頼" --> RES_UX
    SEC_AUD -- "第三者監査" --> I_ARC & A_ARC

### 章4：運用ガイドラインとフッター
```markdown
## 4. 運用ガイドライン

1. 自律性の維持: 各社員は自らの「ガイドライン」を拠り所に判断します。CEOは結果の承認（Approve）と、ガイドラインの調整に注力してください。
2. 証跡の重視: worklog.md や test_report.md など、すべての成果物は「客観的事実」に基づく必要があります。
3. 事業間シナジー: @secretary は、IT事業の技術的成果をブログ事業のコンテンツとして転用するよう常に指示を出します。
4. リサーチャーの活用: 根拠が不明確な場合、全社員は @it-researcher または @ux-researcher に調査を依頼する権利と義務を有します。

---
> **CEO**: [Your Name/ID]  
> **Status**: Operational  
> **Version**: 2026.05.11-Integrated
