---
name: Idea Validator
description: Validate product/business ideas across 6 dimensions with solo dev constraints
argument-hint: "idea_description, [optional: target_market, business_model]"
allowed-tools: bash, grep
---

# Idea Validator Skill

## Overview
Comprehensive validation framework for evaluating product and business ideas before investing significant development time. Designed specifically for solo developers with constraints on time, capital, and resources.

## The 6 Dimensions Framework

### 1. Problem & Solution Fit
**Questions to Answer**:
- What specific problem does this solve?
- Who experiences this problem? (be specific)
- How urgent/painful is the problem? (1-10 scale)
- What solutions currently exist?
- Why is your solution better?
- Can you articulate the problem in one sentence?

**Scoring Criteria (0-100)**:
- **90-100**: Clear, specific problem with weak existing solutions
- **70-89**: Well-defined problem, some competing solutions
- **50-69**: Problem is real but competitors exist with similar features
- **30-49**: Problem is vague or solutions already handle it well
- **0-29**: Problem unclear or better alternatives exist

**Red Flags**:
- Feature/solution comes before identified problem
- Can't explain problem in simple terms
- Problem only affects you specifically
- No evidence others have complained about it

---

### 2. Market Analysis (TAM/SAM/SOM)
**TAM (Total Addressable Market)**: Entire market opportunity for your solution
**SAM (Serviceable Available Market)**: Realistic portion you can target
**SOM (Serviceable Obtainable Market)**: Realistic portion you can actually capture

**Analysis Framework**:

```
TAM Calculation Examples:

SaaS Tool for Developers:
- Global software developers: ~27 million
- Average pricing: $99/year
- TAM = 27M × $99 = $2.67B

Niche: NodeJS developers < $500/year tool
- NodeJS developers: ~5 million
- Addressable at this price: ~500k
- TAM = 500k × $500 = $250M

SMB Accounting Software:
- US SMBs (10-100 employees): ~4M
- % using accounting software: ~70%
- SAM = 4M × 0.7 = 2.8M
- Average deal value: $2000/year
- TAM = 2.8M × $2000 = $5.6B
- SOM (realistic capture in year 5): 0.5%
- SOM = $5.6B × 0.005 = $28M
```

**Scoring Criteria (0-100)**:
- **90-100**: TAM > $1B, clear path to $1M SOM in 3-5 years
- **70-89**: TAM > $100M, SOM > $500k achievable
- **50-69**: TAM > $50M, SOM unclear but possible
- **30-49**: TAM > $10M but SOM very limited
- **0-29**: TAM < $10M or market too fragmented

**Solo Dev Considerations**:
- Small market fine if defensible + loyal customers
- Focus on SOM not TAM (what can you realistically capture)
- Best markets: underserved niches with pricing power
- Avoid: broad consumer markets, price-sensitive segments

---

### 3. Competition Analysis
**Competitive Landscape Assessment**:

```
Direct Competitors: Same problem, similar solution
- Feature comparison matrix
- Pricing comparison
- Customer segments served
- Strengths/weaknesses

Indirect Competitors: Same problem, different solution
- Workarounds customers currently use
- Alternative vendor categories
- Open-source alternatives

Emerging: Early-stage solutions gaining traction
```

**Scoring Criteria (0-100)**:
- **90-100**: No direct competitors, clear market gap, weak indirect solutions
- **70-89**: 1-2 small competitors, different positioning possible
- **50-69**: Established competitors but room for differentiation
- **30-49**: Multiple strong competitors with better resources
- **0-29**: Crowded market, hard to differentiate, entrenched players

**Solo Dev Competitive Advantages**:
- Speed: Can move faster than enterprise competitors
- Niche focus: Can serve underserved segments deeply
- Cost: Lower pricing, higher margins
- Direct relationship: Can engage with customers personally
- Open source: Can build on/integrate with ecosystems
- Specialized expertise: Can own narrow domain deeply

**Questions**:
- What do competitors do well? (don't copy, learn)
- What do customers complain about?
- Why haven't they solved this yet?
- Can you win on price? Speed? Features? Service?
- Is there moat/defensibility? (network effects, switching costs, IP)

---

### 4. Technical Feasibility (Solo Dev)
**Solo Dev Constraints**:
- Time available: Typically 20-40 hrs/week
- Technical depth: Your skillset
- DevOps/scaling requirements
- External dependencies/APIs

**Assessment Framework**:

```
Complexity Score (0-100):

0-20 (Low Complexity):
- Web app, CRUD operations, standard stack
- < 3 months to MVP
- Can be built solo in 2-3 months

21-40 (Medium Complexity):
- Multiple modules, integrations
- Real-time features, moderate scaling
- 3-6 months to MVP, manageable solo

41-60 (High Complexity):
- Complex business logic
- Mobile + backend, payments integration
- 6-12 months, might need contractor help

61-80 (Very High Complexity):
- Distributed systems, AI/ML, blockchain
- Multiple platforms
- 12-24 months, probably need co-founder

81-100 (Unfeasible Solo):
- Hardware required, deep ML, regulatory
- Massive scaling from day 1
- Physical product, FDA approval
```

**Technical Feasibility Checklist**:
- [ ] Stack you know well selected
- [ ] No critical new technology to learn
- [ ] Can be deployed cheaply/easily
- [ ] No regulatory/legal blocker
- [ ] Can start with MVP without years of work
- [ ] Scaling doesn't require infrastructure team
- [ ] Third-party integrations are stable/documented
- [ ] You can build core alone

**Scoring Criteria (0-100)**:
- **90-100**: MVP in 2-3 months using your current skills
- **70-89**: MVP in 3-6 months, maybe 1 library to learn
- **50-69**: MVP in 6-12 months, moderate learning curve
- **30-49**: MVP in 12+ months, significant new skills needed
- **0-29**: Unfeasible for solo dev timeline

---

### 5. Business Model (Unit Economics)
**Key Metrics to Model**:

```
SaaS Example:

Monthly Recurring Revenue (MRR) per customer:
- Tier 1: $29/month × 100 customers = $2,900
- Tier 2: $99/month × 20 customers = $1,980
- Total MRR = $4,880

Customer Acquisition Cost (CAC):
- Time to acquire customer: 5 hours
- Your loaded rate: $50/hr (you value your time)
- CAC = 5 × $50 = $250

Customer Lifetime Value (LTV):
- Average customer lifetime: 24 months
- Monthly churn rate: 5%
- Average lifetime: 1 / 0.05 = 20 months
- LTV = $99 × 20 = $1,980
- LTV/CAC ratio = $1,980/$250 = 7.9x (excellent)

Payback period: $250 / $99 = 2.5 months (good)

One-time Product Example:

Price: $99
COGS: $15 (payment processor, server costs)
Gross Margin: 84%
CAC: $100 (marketing/outreach)
Payback: Impossible (no recurring revenue)
Break-even units: 2-3 per month

```

**Scoring Criteria (0-100)**:
- **90-100**: LTV/CAC > 5x, payback < 3 months, gross margins > 70%
- **70-89**: LTV/CAC > 3x, payback < 6 months, margins > 50%
- **50-69**: LTV/CAC > 1.5x, margins > 30%, unclear path to profit
- **30-49**: LTV/CAC < 1.5x, high CAC, low margins
- **0-29**: Negative unit economics, unsustainable

**Business Model Patterns**:
- **SaaS**: Best for solo dev (recurring, scalable, software margins)
- **One-time license**: Hard without marketing budget
- **Freemium**: Needs viral loop or high conversion
- **Marketplace**: Needs critical mass (chicken/egg problem)
- **Consultancy**: Most reliable, limits scale
- **Hybrid**: Often best (productized service + SaaS)

**Questions**:
- How will you acquire customers? (realistic cost)
- Can customers afford it? (willingness to pay)
- Will they stay? (retention assumptions)
- Can you operate profitably with your time?
- What's the path to $1k MRR? $10k? $100k?

---

### 6. Go-to-Market Strategy
**GTM Channels for Solo Dev**:

```
Inbound (High leverage for solo dev):
- Content marketing (blog, tweets, YouTube)
- Open source (build audience while coding)
- SEO (long-tail keywords)
- Community building (Discord, Slack)

Outbound (More manual, limited scale):
- Direct sales (email, LinkedIn)
- Industry partnerships
- Guest blogging, podcasts
- Industry conferences (expensive, limited time)

Product-led (Best for dev tools):
- Free tier / freemium
- In-product virality
- API partnerships
- Integration marketplaces
```

**MVP Launch Plan**:
1. **Day 1-7**: Soft launch to your network
2. **Week 2**: First feedback iteration
3. **Month 1**: Public launch with initial marketing
4. **Month 2-3**: Refine messaging based on traction
5. **Month 4+**: Grow with working channels

**Scoring Criteria (0-100)**:
- **90-100**: Clear, low-cost GTM you can execute (inbound/content, dev community)
- **70-89**: Multiple channels possible, some require paid ads
- **50-69**: Viable GTM but requires significant marketing investment
- **30-49**: High CAC, requires sales team or major marketing spend
- **0-29**: GTM unclear, requires resources you don't have

**Solo Dev GTM Strengths**:
- Authenticity (real founder talking about problem)
- Speed (can iterate messaging weekly)
- Community (dev tools community is active)
- Content (can write, code, speak about expertise)

---

## Validation Scoring Sheet

```markdown
# Idea Validation Report

**Idea**: [Your idea]
**Date**: [Date]
**Evaluated By**: [Your name]

## Dimension Scores

| Dimension | Score | Reasoning |
|-----------|-------|-----------|
| Problem & Solution Fit | /100 | Clear problem, weak solutions exist |
| Market Analysis | /100 | TAM $200M, addressable $5M niche |
| Competition | /100 | 2 large competitors, room for differentiation |
| Technical Feasibility | /100 | MVP in 4 months, stack is known |
| Business Model | /100 | LTV/CAC 6x, margins 75% |
| Go-to-Market | /100 | Strong content marketing, dev community fit |

**Average Score**: /100

---

## Final Verdict

### 🟢 VALIDATED (Score > 70)
Idea is worth pursuing. Clear market opportunity, solvable problem, realistic business model, and achievable MVP. Recommend building MVP and testing with 10-20 potential customers within 2-3 months.

### 🟡 NEEDS MORE RESEARCH (Score 50-70)
Idea has potential but requires more validation. Before committing significant time:
- [ ] Talk to 10-20 target users about problem
- [ ] Research competitive landscape deeper
- [ ] Model unit economics more carefully
- [ ] Clarify technical approach
- [ ] Revisit go-to-market strategy

### 🔴 NOT RECOMMENDED (Score < 50)
Significant blockers identified. Either:
- Market too competitive/saturated
- Problem not urgent enough for customers
- Unit economics don't work
- Technical complexity too high for solo dev
- Better alternative solutions exist

---

## Key Risks & Mitigation

1. **Risk**: [Identified risk]
   - **Impact**: High/Medium/Low
   - **Mitigation**: [How to reduce]

2. [Continue for top 5 risks]

---

## Next Steps

If Validated or Needs Research:
1. Define MVP scope (1-month build)
2. Identify 5-10 potential beta users
3. Build minimum version
4. Collect feedback and usage data
5. Iterate or pivot based on data

If Not Recommended:
- Consider pivoting to adjacent market
- Address key blockers before investing more time
- Explore related ideas that scored better
```

## Tips for Solo Developers

1. **Speed of learning > Deep expertise**: Pick ideas in domains you can learn quickly
2. **Leverage existing assets**: What do you already know? Existing audience? Code base?
3. **Time to revenue matters**: Ideas that take 12+ months to first dollar are risky
4. **Customer proximity**: Can you reach customers cheaply/directly?
5. **Defensibility**: What keeps competitors from copying in 6 months?
6. **Passion test**: Can you stay motivated if growth is slow?
7. **Avoid feature ideas**: "Like Slack but for X" usually fails (features, not products)

## When to Pivot

- Problem not as painful as assumed
- Unit economics worse than modeled
- Strong competitors moving to same space
- Go-to-market requires skills you don't have
- Takes 2x longer than estimated to build MVP

## Resources

- Jobs to be Done framework
- Lean Canvas (better than Business Model Canvas for startups)
- Y Combinator: Startup ideas guide
- Indie Hackers: Validation discussions
- r/IdeaValidation subreddit

---

**Remember**: The best ideas are the ones you build. Good ideas executed beats perfect ideas not shipped.
