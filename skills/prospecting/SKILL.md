---
name: Lead Prospecting
description: Find and qualify potential customers for SaaS products using BANT framework and multiple sources
argument-hint: "product_name, target_industry, [optional: budget_range, company_size, region]"
allowed-tools: bash, grep
---

# Lead Prospecting Skill

## Overview
This skill helps you identify and qualify high-potential leads for your SaaS product using the BANT framework across multiple sources.

## BANT Framework
- **Budget**: Can they afford your product?
- **Authority**: Are they decision-makers?
- **Need**: Does your product solve their problem?
- **Timeline**: When might they buy?

## Sources Searched
1. **Product Hunt** - Early adopters, tech-savvy founders
2. **LinkedIn** - Decision-makers, company research
3. **GitHub** - Developers, open-source contributors (for dev-focused products)
4. **Reddit** - Communities with pain points
5. **Industry Directories** - YCombinator, Crunchbase, AngelList
6. **Twitter/X** - Followers in your niche

## Output Format
Markdown file with qualified leads containing:
- Company name / Person name
- Contact info
- Qualification score (0-100)
- BANT assessment
- Personalized outreach message
- Source

## Instructions

### Step 1: Research Phase
Gather information about your target market:
```bash
# Example search queries to construct
# Product Hunt: "product_category AND founding_date:2023-2026"
# LinkedIn: "title:(founder OR CTO OR 'Head of Product') industry:software"
# GitHub: "language:typescript OR javascript stars:>1000"
# Reddit: "subreddit:r/AskStartups OR r/SaaS"
```

### Step 2: Lead Identification
For each source, extract:
- Name and title/role
- Company information
- Contact details (email when available)
- Social profiles
- Recent activity/signals
- Potential pain points based on activity

### Step 3: BANT Qualification Scoring
Evaluate each lead:

```
Budget (0-25 points):
- 0-10: Company size < 10 people or bootstrapped
- 10-15: Startup with seed funding
- 15-20: Series A/B funded or profitable SMB
- 20-25: Enterprise or well-funded growth stage

Authority (0-25 points):
- 0-10: Junior level, needs approval
- 10-15: Senior individual contributor
- 15-20: Manager/director level
- 20-25: C-suite, founder, clear decision-maker

Need (0-25 points):
- 0-10: Weak signal or unclear fit
- 10-15: Related pain point but not primary
- 15-20: Strong signal, direct pain point
- 20-25: Urgent need, mentioned problem publicly

Timeline (0-25 points):
- 0-5: No urgency signals
- 5-10: Vague future consideration
- 10-15: Planning/evaluation phase
- 15-20: Active buying signals
- 20-25: Immediate need, budget allocated
```

### Step 4: Personalization
For each qualified lead (score > 60), generate:

**Outreach Template**:
```
Subject: [Personalization element] + Value prop

Hi [First Name],

I came across your [specific action/project] at [company/platform] and noticed you're working on [specific challenge your product solves].

We built [product name] specifically to help teams like yours with [specific pain point], and it's helped similar companies [quantified benefit].

Would you be open to a 15-min chat to see if it's a fit?

Best,
[Your name]
[Your title]
[Product link]
```

### Step 5: Generate Output
Create `qualified-leads-[date].md` with:

```markdown
# Qualified Leads Report
Generated: [date]
Product: [product name]
Target: [industry/segment]

## Summary
- Total researched: X
- Qualified (>60): Y
- High priority (>75): Z

## High Priority Leads (Score >75)

### 1. [Name] - Score: 85
- **Company**: [Company name]
- **Title**: [Job title]
- **Email**: [Email or LinkedIn]
- **BANT Assessment**:
  - Budget: 20 (Series A funded, growth stage)
  - Authority: 23 (Founder/CTO)
  - Need: 22 (Public tweets about pain point)
  - Timeline: 20 (Recently hired team in area)
- **Outreach Message**:
  > Hi [Name], saw your recent thread about [specific problem]. We built [product] to solve exactly this...

---

[Continue for all qualified leads, sorted by score descending]
```

## Checklist
- [ ] Defined target industry/persona
- [ ] Researched at least 3 sources
- [ ] Qualified minimum 10 leads
- [ ] Applied BANT framework consistently
- [ ] Personalized each outreach message
- [ ] Included contact information
- [ ] Sorted by qualification score
- [ ] Generated markdown report

## Tips for Solo Developers
1. **Focus on niche**: Target a specific industry vertically first
2. **Automation possible**: Script LinkedIn/GitHub scraping (respect ToS)
3. **Quality > Quantity**: 5 perfect leads > 100 mediocre ones
4. **Use free tools**: Google Alerts, SimilarWeb, Hunter.io (free tier)
5. **Track results**: Note response rates by source for optimization
6. **Timing matters**: Reach out Tuesday-Thursday, 9-11am their timezone
7. **Follow-up system**: Qualify for 2-week follow-up cadence

## Tools & Resources
- Hunter.io - Email finder
- RocketReach - Contact database
- Crunchbase - Company data
- Product Hunt API - Early adopters
- GitHub API - Developer signals
- Twitter API - Founder activity
- LinkedIn Sales Navigator - B2B targeting

## Success Metrics
- Response rate: 5-10% is healthy
- Meeting rate: 20-30% of responses
- Qualification accuracy: Refine BANT weights based on deals won
- Cost per qualified lead: Track time investment

---

**Next Steps**: Once you have your lead list, use the outreach template to initiate contact. Track responses and iterate on your messaging based on what works.
