---
name: Landing Page Generator
description: Generate high-conversion landing pages with SEO, performance optimization, and pt-BR copy
argument-hint: "product_name, value_proposition, [optional: target_audience, pricing_model]"
allowed-tools: bash, grep
---

# Landing Page Generator Skill

## Overview
Generates production-ready, high-converting landing pages with:
- SEO optimization (meta tags, Open Graph, schema.org)
- Performance targeting: Lighthouse > 90
- Copy in Portuguese (pt-BR) with conversational, benefit-focused tone
- Multiple stack options: Next.js + Tailwind or static HTML
- Complete sections: Hero, Pain Points, Solution, How It Works, Social Proof, Pricing, FAQ, CTA
- ASCII wireframes for all sections
- Mobile-responsive design

## Section Structure

### 1. Hero Section
**Purpose**: Capture attention, communicate value prop in 3 seconds

**ASCII Wireframe**:
```
┌─────────────────────────────────────────┐
│         [Logo]        [Nav Links]       │
├─────────────────────────────────────────┤
│                                         │
│    BIG BOLD HEADLINE                   │
│    "Problem solver + Benefit"          │
│                                         │
│    Subheading explaining what          │
│                                         │
│         [CTA Button] [Secondary]       │
│                                         │
│              [Hero Image]              │
│                                         │
└─────────────────────────────────────────┘
```

**Copy Template (pt-BR)**:
```
Headline: "[Seu Problema] acabou"
Subheading: "Ganhe [Quantifiable benefit] com [Diferentiador] em apenas [timeframe]"

Example:
Headline: "Sua equipe de vendas finalmente funciona"
Subheading: "Aumente suas vendas em 3x em 30 dias com automação inteligente de prospecção"
```

**Guidelines**:
- Headline: 5-10 words max
- Subheading: One sentence, benefits-focused
- Use power words: Ganhe, Aumente, Domine, Simplifique, Revolucione
- CTA: "Comece Grátis" or "Ver Demo"
- No jargon, speak to outcome not features

---

### 2. Pain Points Section
**Purpose**: Show you understand their problems deeply

**ASCII Wireframe**:
```
┌─────────────────────────────────────────┐
│     "Os 3 Maiores Problemas"           │
├──────┬──────────┬──────────────────────┤
│ Icon │          │                      │
│ 🔥   │ Problema │ Descrição do        │
│      │ 1        │ impacto negativo    │
├──────┼──────────┼──────────────────────┤
│ Icon │          │                      │
│ ❌   │ Problema │ Descrição do        │
│      │ 2        │ impacto negativo    │
├──────┼──────────┼──────────────────────┤
│ Icon │          │                      │
│ ⚠️   │ Problema │ Descrição do        │
│      │ 3        │ impacto negativo    │
└──────┴──────────┴──────────────────────┘
```

**Content Formula**:
```
Problema 1: [Ineficiência concreta]
Descrição: Você perde [X horas/recursos] todo dia com [atividade chata]

Problema 2: [Custo/Risco]
Descrição: Seus [custos/riscos] crescem porque [motivo específico]

Problema 3: [Oportunidade perdida]
Descrição: Você não consegue [resultado desejado] porque [bloqueador]
```

**Example for Prospecting Tool**:
```
Problema 1: Prospecção Manual Consome Tempo
Descrição: Você perde 10+ horas por semana procurando leads manualmente no LinkedIn,
Product Hunt e GitHub. Tempo que poderia estar fechando vendas.

Problema 2: Leads de Baixa Qualidade
Descrição: Quando você encontra leads, muitos não têm orçamento ou autoridade.
Resultado: taxa de conversão abaixo de 2% e muitas reuniões perdidas.

Problema 3: Sem Sistema de Priorização
Descrição: Sem forma de saber qual lead é mais promissor, você trata todos igual.
Os melhores não são acionados a tempo.
```

---

### 3. Solution/Benefits Section
**Purpose**: Show how you solve each pain point

**ASCII Wireframe**:
```
┌─────────────────────────────────────────┐
│        "Conheca [Product Name]"         │
├─────────────────────────────────────────┤
│           [Product Image/Video]         │
├──────────────┬────────────────────────┤
│ ✅ Beneficio │ Descrição detalhada  │
│              │ de como resolve      │
├──────────────┼────────────────────────┤
│ ✅ Beneficio │ Descrição detalhada  │
│              │ de como resolve      │
├──────────────┼────────────────────────┤
│ ✅ Beneficio │ Descrição detalhada  │
│              │ de como resolve      │
└──────────────┴────────────────────────┘
```

**Benefit Formula**:
```
Para cada problema, mostrar:
- Benefício específico (resultado quantificado)
- Como a solução entrega isso
- Diferenciador que você tem
```

**Example**:
```
❌ Prospecção Manual → ✅ Busca Automática
Benefício: Encontre 100 leads qualificados por semana sem levantar um dedo
Como: IA analisa dados de Product Hunt, LinkedIn, GitHub e Reddit em tempo real
Diferencial: Modelo BANT integrado filtra automaticamente autoridade e orçamento

❌ Leads de Baixa Qualidade → ✅ Score de Qualificação
Benefício: Aumenta taxa de conversão de 2% para 8%+ focando nos melhores
Como: Algoritmo propriedário nota cada lead em 4 dimensões críticas
Diferencial: Aprende com seus deals ganhos/perdidos, melhora continuamente

❌ Sem Priorização → ✅ Action-Ready Leads
Benefício: Seus melhores leads já vêm com mensagem de outreach personalizada
Como: IA gera contexto único para cada lead baseado em atividade pública
Diferencial: Mensagens mencionam projetos específicos, aumentam resposta em 3x
```

---

### 4. How It Works Section
**Purpose**: Make implementation seem easy (even if complex)

**ASCII Wireframe**:
```
┌──────────────────────────────────────────────┐
│        "Como Funciona em 3 Passos"          │
├────┬────────┬────┬────────┬────┬──────────┤
│ 1  │        │ 2  │        │ 3  │          │
│    │ Passo │    │ Passo │    │ Resultado│
│ 🔗 │ Setup │ → │ Configurar→ │ 💰 Resultado
│    │       │    │        │    │          │
└────┴────────┴────┴────────┴────┴──────────┘

Passo 1:
[Visual/Icon]
Titulo curto
Uma frase explicando

Passo 2:
[Visual/Icon]
Titulo curto
Uma frase explicando

Passo 3:
[Visual/Icon]
Titulo curto
Uma frase explicando
```

**Keep It Simple**:
- Max 4 passos (3 ideal)
- Each step: 1 icon + 5 word title + 1 sentence description
- Focus on outcomes, not features
- Show screenshots if relevant
- Make it feel inevitable, not difficult

**Example**:
```
Passo 1: Conecte Suas Fontes
Integre com Product Hunt, LinkedIn, GitHub, Reddit em minutos.
Sem código necessário.

Passo 2: Configure Sua Estratégia
Defina seu público alvo, orçamento mínimo, e segmentos.
IA aprende seus critérios.

Passo 3: Receba Leads Qualificados
Todo dia, receba 15-20 leads BANT-qualificados direto na sua caixa.
Mensagens prontas para enviar.
```

---

### 5. Social Proof Section
**Purpose**: Reduce risk with evidence from others

**ASCII Wireframe**:
```
┌──────────────────────────────────────────┐
│    "Mais de 500 Founders Confiam"      │
├──────────────┬─────────────────────────┤
│              │ "Quote poderosa        │
│ [Avatar]     │ provando resultado"    │
│ Name, Title  │ - Name, Company, Logo │
├──────────────┼─────────────────────────┤
│ [Avatar]     │ "Quote sobre a        │
│ Name, Title  │ mudança que causou"   │
│ Name, Company│ - Name, Company, Logo │
├──────────────┼─────────────────────────┤
│              │ [Customer Logo Wall]   │
│              │ Logo1 Logo2 Logo3...  │
└──────────────┴─────────────────────────┘
```

**What To Include**:
1. **Testimonials** (2-3 powerful ones)
   - Name, title, company, photo
   - Result they got (specific number)
   - Quote about transformation

2. **Customer Logos** (4-8 recognizable ones)
   - Just logos, no context needed
   - If you don't have 8, show fewer (quality > quantity)

3. **Stats** (if you have them)
   - "500+ founders"
   - "4.9/5 stars"
   - "$10M+ in sales generated"
   - "98% retention"

**Testimonial Template**:
```
"Aumentamos nossas vendas em 250% no primeiro mês.
Antes éramos caóticos na prospecção, agora temos um funil previsível."

— João Silva, CEO Startup X
```

---

### 6. Pricing Section
**Purpose**: Make buying easy with transparent options

**ASCII Wireframe**:
```
┌────────────────────────────────────────────┐
│   "Simples e Transparente, Sem Surpresas" │
├──────────┬──────────┬──────────┬──────────┤
│  STARTER │  PRO     │ BUSINESS │ CUSTOM   │
│  R$99    │  R$299   │  R$999   │ Contato  │
│  /mês    │  /mês    │  /mês    │          │
├──────────┼──────────┼──────────┼──────────┤
│ ✓ 500    │ ✓ 2000   │ ✓ 10000  │ ✓ Custom │
│   leads  │   leads  │   leads  │ integr.  │
│ ✓ Search │ ✓ Search │ ✓ Search │          │
│ ✓ Score  │ ✓ Score  │ ✓ Score  │          │
│ ✓ 1 seat │ ✓ 3 seat │ ✓ 10 seat│ ✓ API    │
│          │ ✓ API    │ ✓ API    │ ✓ SLA    │
├──────────┼──────────┼──────────┼──────────┤
│ Comece   │ Popular  │ Empresa  │ Fale     │
│ [CTA]    │ [CTA]    │ [CTA]    │ [CTA]    │
└──────────┴──────────┴──────────┴──────────┘
```

**Pricing Strategy for Solo Dev SaaS**:
1. **Freemium**: Free tier attracts, paid tier monetizes
   - Free: 100 leads/month, 1 search
   - Pro: 2000 leads, unlimited searches

2. **Tiered**: 2-3 tiers with clear progression
   - Starter: Solo founder
   - Pro: Small team
   - Enterprise: Scaling companies

3. **Value-based**: Price based on customer benefit
   - If product saves 10 hours/week at $50/hr = worth $500/month
   - Charge $100-200/month (20-40% of value)

**Pricing Tips**:
- Don't hide pricing (don't have separate "Contact us" page)
- Show annual discount (20% off usually good)
- Highlight most popular tier
- Be transparent: "No credit card required" if freemium
- Include usage tiers clearly

**Example Pricing Copy**:
```
STARTER - R$ 99/mês
Perfeito para founder solo
- 500 leads/mês qualificados
- Busca manual de fontes
- Score BANT automático
- Chat de suporte
- Comece grátis

PRO - R$ 299/mês (MAIS POPULAR)
Para pequenas equipes
- 2000 leads/mês qualificados
- Busca automática 24/7
- Score BANT + insights IA
- Até 3 usuários
- API access
- Suporte prioritário
- Comece grátis

BUSINESS - R$ 999/mês
Para escalas mais altas
- 10000 leads/mês
- Customização completa
- Até 10 usuários
- Integração com CRM
- SLA de 99.9%
- Onboarding pessoal
- Agende demo
```

---

### 7. FAQ Section
**Purpose**: Answer objections and reduce friction

**ASCII Wireframe**:
```
┌──────────────────────────────────────────┐
│  "Perguntas Frequentes"                 │
├──────────────────────────────────────────┤
│ ▼ Pergunta 1?                           │
│   └─ Resposta clara, benefício implícito│
│ ▶ Pergunta 2?                           │
│ ▶ Pergunta 3?                           │
│ ▶ Pergunta 4?                           │
│ ▶ Pergunta 5?                           │
└──────────────────────────────────────────┘
```

**FAQs Template** (answer real objections):

```
P: Qual é a qualidade dos leads?
R: Filtramos com modelo BANT propriétário que aprende com seus dados.
Clientes normalmente veem 5-8% de taxa de conversão vs 2% anterior.

P: Posso integrar com meu CRM?
R: Sim! Suportamos Hubspot, Pipedrive, Salesforce via Zapier no Pro.
Business tier tem integrações diretas.

P: E se não gostar?
R: Sem problemas! Cancelar leva 30 segundos. Sem contratos de longo prazo,
cancel a qualquer hora. Mas 95% dos clientes ativam logo no mês 1.

P: Como vocês garantem privacidade dos dados?
R: LGPD compliant. Dados dos usuários não são compartilhados.
Criptografia end-to-end. Auditoria externa anualmente.

P: Quanto tempo leva para ver resultados?
R: Primeiro lote de leads em < 1 hora após setup.
Maior parte dos clientes fecha primeira venda em semana 1-2.

P: Qual é o contrato mínimo?
R: Mensal. Sem setup fees, sem surpresas. Pay as you go.
```

**Strategy**: List 5-7 FAQs addressing:
- Product: "How does it work?"
- Quality: "What's the quality?"
- Integration: "Does it work with X?"
- Price: "Can I cancel?"
- Risk: "What if it doesn't work?"
- Time: "How long until results?"
- Trust: "Is my data safe?"

---

### 8. Final CTA Section
**Purpose**: Convert at the last moment

**ASCII Wireframe**:
```
┌──────────────────────────────────────────┐
│                                          │
│   BOLD HEADLINE: "Pronto para Começar?"  │
│                                          │
│   Subheading: One benefit statement     │
│                                          │
│        [LARGE CTA BUTTON - 2ndary]      │
│                                          │
│   Smaller text: "No credit card required"│
│   "14-day trial" or "Free forever"      │
│                                          │
│        Logos: [Trusted by X]            │
│                                          │
└──────────────────────────────────────────┘
```

**Copy Template**:
```
Headline: "Seus leads qualificados esperam"
Subheading: "Comece em < 5 minutos. Primeiro lote de leads amanhã."

Button: "Comece Seu Trial Gratuito"
Small text: "Sem cartão de crédito. Cancele quando quiser."
Trust markers: "14-day free trial • No credit card • Cancel anytime"
```

---

## SEO & Performance Optimization

### Meta Tags & Open Graph

```html
<head>
  <!-- Core Meta -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Encontre Leads Qualificados Automaticamente | ProspectAI</title>

  <meta name="description"
        content="Aumente suas vendas com prospecção automática alimentada por IA.
        Encontre 100+ leads BANT-qualificados por semana em 5 minutos. Teste grátis.">

  <meta name="keywords"
        content="lead generation, prospecting, saas, sales automation, linkedin leads">

  <!-- Open Graph (for social sharing) -->
  <meta property="og:title" content="Encontre Leads Qualificados Automaticamente">
  <meta property="og:description"
        content="Aumente suas vendas com prospecção automática. Sem trabalho manual.">
  <meta property="og:image" content="https://yoursite.com/og-image.png">
  <meta property="og:url" content="https://yoursite.com">
  <meta property="og:type" content="website">

  <!-- Twitter -->
  <meta property="twitter:card" content="summary_large_image">
  <meta property="twitter:title" content="Encontre Leads Qualificados Automaticamente">
  <meta property="twitter:description" content="Prospecção automática com IA...">
  <meta property="twitter:image" content="https://yoursite.com/twitter-image.png">

  <!-- Schema.org Structured Data -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "SoftwareApplication",
    "name": "ProspectAI",
    "description": "Prospecting automation powered by AI",
    "applicationCategory": "BusinessApplication",
    "offers": {
      "@type": "Offer",
      "price": "99",
      "priceCurrency": "BRL"
    },
    "aggregateRating": {
      "@type": "AggregateRating",
      "ratingValue": "4.9",
      "ratingCount": "500"
    }
  }
  </script>
</head>
```

### Performance Optimization

**Target: Lighthouse > 90**

```html
<!-- Images: Use next/image or lazy load -->
<img src="image.webp" alt="descriptive alt" loading="lazy" width="800" height="600">

<!-- CSS: Inline critical, defer non-critical -->
<link rel="preload" as="style" href="critical.css">
<link rel="stylesheet" href="critical.css">
<link rel="preload" as="style" href="defer.css">
<link rel="stylesheet" href="defer.css" media="print" onload="this.media='all'">

<!-- JS: Defer and async -->
<script src="analytics.js" async></script>
<script src="app.js" defer></script>

<!-- Fonts: Font-display swap -->
@font-face {
  font-family: 'CustomFont';
  src: url('font.woff2');
  font-display: swap; /* Show fallback while loading */
}
```

## Next.js Implementation

**File: `app/page.tsx`**

```typescript
import Image from 'next/image';
import { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Encontre Leads Qualificados Automaticamente | ProspectAI',
  description: 'Aumente suas vendas com prospecção automática. Teste grátis.',
  openGraph: {
    title: 'Encontre Leads Qualificados Automaticamente',
    description: 'Prospecting automation powered by AI',
    images: ['/og-image.png'],
  },
};

export default function Home() {
  return (
    <>
      <header className="sticky top-0 z-50 bg-white shadow-sm">
        <nav className="container mx-auto flex justify-between items-center px-4 py-4">
          <div className="text-2xl font-bold text-blue-600">ProspectAI</div>
          <ul className="hidden md:flex gap-8">
            <li><a href="#benefits">Benefícios</a></li>
            <li><a href="#how">Como Funciona</a></li>
            <li><a href="#pricing">Preços</a></li>
            <li><a href="#faq">FAQ</a></li>
          </ul>
          <button className="bg-blue-600 text-white px-4 py-2 rounded">
            Comece Grátis
          </button>
        </nav>
      </header>

      {/* Hero Section */}
      <section className="container mx-auto px-4 py-20 text-center">
        <h1 className="text-5xl font-bold mb-4">
          Sua equipe de vendas finalmente funciona
        </h1>
        <p className="text-xl text-gray-600 mb-8 max-w-2xl mx-auto">
          Aumente suas vendas em 3x em 30 dias com automação inteligente de prospecção
        </p>
        <button className="bg-blue-600 text-white px-8 py-3 rounded-lg text-lg mb-4">
          Comece Seu Trial Gratuito
        </button>
        <p className="text-gray-500">Sem cartão de crédito. 14 dias grátis.</p>

        <Image
          src="/hero-image.png"
          alt="ProspectAI Dashboard"
          width={800}
          height={500}
          className="mt-12"
          priority
        />
      </section>

      {/* Pain Points */}
      <section id="benefits" className="bg-gray-50 py-20">
        <div className="container mx-auto px-4">
          <h2 className="text-4xl font-bold mb-12 text-center">
            Os 3 Maiores Problemas
          </h2>

          <div className="grid md:grid-cols-3 gap-8">
            <div className="bg-white p-8 rounded-lg shadow">
              <div className="text-4xl mb-4">🔥</div>
              <h3 className="text-xl font-bold mb-4">Prospecção Manual Consome Tempo</h3>
              <p>Você perde 10+ horas por semana procurando leads manualmente.
              Tempo que poderia estar fechando vendas.</p>
            </div>

            <div className="bg-white p-8 rounded-lg shadow">
              <div className="text-4xl mb-4">❌</div>
              <h3 className="text-xl font-bold mb-4">Leads de Baixa Qualidade</h3>
              <p>Muitos não têm orçamento ou autoridade. Resultado: 2% conversão
              e muitas reuniões perdidas.</p>
            </div>

            <div className="bg-white p-8 rounded-lg shadow">
              <div className="text-4xl mb-4">⚠️</div>
              <h3 className="text-xl font-bold mb-4">Sem Sistema de Priorização</h3>
              <p>Sem forma de saber qual lead é melhor, você trata todos igual.
              Os melhores não são acionados a tempo.</p>
            </div>
          </div>
        </div>
      </section>

      {/* How It Works */}
      <section id="how" className="container mx-auto px-4 py-20">
        <h2 className="text-4xl font-bold mb-12 text-center">Como Funciona em 3 Passos</h2>

        <div className="grid md:grid-cols-3 gap-8">
          <div className="text-center">
            <div className="text-5xl mb-4">1️⃣</div>
            <h3 className="text-xl font-bold mb-4">Conecte Suas Fontes</h3>
            <p>Integre com Product Hunt, LinkedIn, GitHub em minutos. Sem código necessário.</p>
          </div>

          <div className="text-center">
            <div className="text-5xl mb-4">2️⃣</div>
            <h3 className="text-xl font-bold mb-4">Configure Sua Estratégia</h3>
            <p>Defina seu público alvo, orçamento mínimo. IA aprende seus critérios.</p>
          </div>

          <div className="text-center">
            <div className="text-5xl mb-4">3️⃣</div>
            <h3 className="text-xl font-bold mb-4">Receba Leads Qualificados</h3>
            <p>Todo dia, 15-20 leads BANT-qualificados direto na sua caixa. Prontos para enviar.</p>
          </div>
        </div>
      </section>

      {/* Pricing */}
      <section id="pricing" className="bg-gray-50 py-20">
        <div className="container mx-auto px-4">
          <h2 className="text-4xl font-bold mb-4 text-center">
            Simples e Transparente, Sem Surpresas
          </h2>
          <p className="text-center text-gray-600 mb-12">
            Cancele quando quiser. Sem contratos de longo prazo.
          </p>

          <div className="grid md:grid-cols-3 gap-8">
            {/* Starter */}
            <div className="bg-white p-8 rounded-lg shadow">
              <h3 className="text-2xl font-bold mb-2">STARTER</h3>
              <p className="text-gray-600 mb-6">Para founder solo</p>
              <p className="text-4xl font-bold mb-6">R$ 99<span className="text-lg">/mês</span></p>

              <ul className="space-y-3 mb-8">
                <li>✓ 500 leads/mês</li>
                <li>✓ Score BANT</li>
                <li>✓ Chat support</li>
                <li>✗ API</li>
              </ul>

              <button className="w-full bg-gray-200 text-gray-800 px-4 py-3 rounded-lg">
                Comece Grátis
              </button>
            </div>

            {/* Pro */}
            <div className="bg-blue-600 text-white p-8 rounded-lg shadow border-4 border-blue-600 relative">
              <div className="absolute -top-4 left-1/2 transform -translate-x-1/2 bg-yellow-400 text-black px-4 py-1 rounded font-bold">
                MAIS POPULAR
              </div>

              <h3 className="text-2xl font-bold mb-2">PRO</h3>
              <p className="mb-6 opacity-90">Para pequenas equipes</p>
              <p className="text-4xl font-bold mb-6">R$ 299<span className="text-lg">/mês</span></p>

              <ul className="space-y-3 mb-8">
                <li>✓ 2000 leads/mês</li>
                <li>✓ Score BANT + IA</li>
                <li>✓ Até 3 usuários</li>
                <li>✓ API access</li>
              </ul>

              <button className="w-full bg-white text-blue-600 px-4 py-3 rounded-lg font-bold hover:bg-gray-100">
                Comece Grátis
              </button>
            </div>

            {/* Business */}
            <div className="bg-white p-8 rounded-lg shadow">
              <h3 className="text-2xl font-bold mb-2">BUSINESS</h3>
              <p className="text-gray-600 mb-6">Para escalas maiores</p>
              <p className="text-4xl font-bold mb-6">R$ 999<span className="text-lg">/mês</span></p>

              <ul className="space-y-3 mb-8">
                <li>✓ 10k leads/mês</li>
                <li>✓ Customização</li>
                <li>✓ Até 10 usuários</li>
                <li>✓ SLA 99.9%</li>
              </ul>

              <button className="w-full bg-blue-600 text-white px-4 py-3 rounded-lg">
                Agende Demo
              </button>
            </div>
          </div>
        </div>
      </section>

      {/* FAQ */}
      <section id="faq" className="container mx-auto px-4 py-20">
        <h2 className="text-4xl font-bold mb-12 text-center">Perguntas Frequentes</h2>

        <div className="max-w-2xl mx-auto space-y-4">
          <details className="bg-gray-50 p-6 rounded-lg cursor-pointer">
            <summary className="font-bold text-lg">
              Qual é a qualidade dos leads?
            </summary>
            <p className="mt-4 text-gray-700">
              Filtramos com modelo BANT que aprende com seus dados.
              Clientes normalmente veem 5-8% conversão vs 2% anterior.
            </p>
          </details>

          <details className="bg-gray-50 p-6 rounded-lg cursor-pointer">
            <summary className="font-bold text-lg">
              E se não gostar?
            </summary>
            <p className="mt-4 text-gray-700">
              Cancelar leva 30 segundos. Sem contratos de longo prazo.
            </p>
          </details>

          <details className="bg-gray-50 p-6 rounded-lg cursor-pointer">
            <summary className="font-bold text-lg">
              Como vocês garantem privacidade dos dados?
            </summary>
            <p className="mt-4 text-gray-700">
              LGPD compliant. Criptografia end-to-end. Auditoria externa anualmente.
            </p>
          </details>
        </div>
      </section>

      {/* Final CTA */}
      <section className="bg-blue-600 text-white py-20 text-center">
        <h2 className="text-4xl font-bold mb-4">Pronto para Começar?</h2>
        <p className="text-xl mb-8 opacity-90">
          Seus leads qualificados esperam. Comece em menos de 5 minutos.
        </p>
        <button className="bg-white text-blue-600 px-8 py-3 rounded-lg text-lg font-bold hover:bg-gray-100">
          Comece Seu Trial Gratuito
        </button>
        <p className="mt-4 text-sm">Sem cartão de crédito. 14 dias grátis. Cancel anytime.</p>
      </section>

      {/* Footer */}
      <footer className="bg-gray-800 text-white py-12">
        <div className="container mx-auto px-4 grid md:grid-cols-4 gap-8">
          <div>
            <h4 className="font-bold mb-4">ProspectAI</h4>
            <p className="text-gray-400">Automação inteligente de prospecção.</p>
          </div>
          <div>
            <h4 className="font-bold mb-4">Produto</h4>
            <ul className="text-gray-400 space-y-2">
              <li><a href="#">Features</a></li>
              <li><a href="#">Pricing</a></li>
              <li><a href="#">Security</a></li>
            </ul>
          </div>
          <div>
            <h4 className="font-bold mb-4">Empresa</h4>
            <ul className="text-gray-400 space-y-2">
              <li><a href="#">Blog</a></li>
              <li><a href="#">Contato</a></li>
              <li><a href="#">Sobre</a></li>
            </ul>
          </div>
          <div>
            <h4 className="font-bold mb-4">Legal</h4>
            <ul className="text-gray-400 space-y-2">
              <li><a href="#">Privacidade</a></li>
              <li><a href="#">Termos</a></li>
              <li><a href="#">LGPD</a></li>
            </ul>
          </div>
        </div>
        <div className="border-t border-gray-700 mt-8 pt-8 text-center text-gray-400">
          <p>© 2024 ProspectAI. Todos os direitos reservados.</p>
        </div>
      </footer>
    </>
  );
}
```

## Tailwind Configuration

**File: `tailwind.config.ts`**

```typescript
import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        primary: '#2563eb',
        secondary: '#1e40af',
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
export default config
```

## Performance Checklist

- [ ] All images optimized (WebP, lazy loaded)
- [ ] CSS critical path inlined
- [ ] JavaScript deferred/async
- [ ] Fonts optimized with font-display: swap
- [ ] Lighthouse score > 90
- [ ] Core Web Vitals passing
- [ ] Meta tags complete
- [ ] Open Graph images correct
- [ ] Schema.org structured data valid
- [ ] Mobile responsive tested
- [ ] Form validation working
- [ ] CTA buttons have tracking
- [ ] Analytics configured
- [ ] 404/error pages exist

## Deployment Checklist

- [ ] Domain configured
- [ ] HTTPS enabled
- [ ] DNS records correct
- [ ] Email service configured (for signups)
- [ ] Analytics/tracking installed
- [ ] Monitoring/alerts set up
- [ ] Backups automated
- [ ] SEO sitemap.xml created
- [ ] robots.txt configured
- [ ] CSP headers set
- [ ] Redirect old URLs if migrating

## Copy Tone Guide (pt-BR)

**DO**:
- Conversational, like talking to a friend
- Specific numbers: "3x" not "much more"
- Active voice: "Ganhe" not "Você pode ganhar"
- Benefit-focused: "Passe menos tempo", not "Feature: automation"
- Power words: Revolucione, Domine, Aumente, Ganhe, Simplifique

**DON'T**:
- Jargon: "Synergy", "Ecosystem", "Paradigm"
- Weasel words: "May", "Could", "Possibly"
- All caps except for emphasis
- Passive voice: Avoid "será realizado"
- Vague: "Better", "Faster" (use numbers)

---

**Next Steps**:
1. Customize copy for your specific product
2. Replace images with your own
3. Set up email capture form
4. Configure analytics
5. Test all links and buttons
6. Run Lighthouse audit
7. Deploy to production

