# React Rules

## Components
- Always functional (never classes)
- Props typed with interface
- Default export for pages, named export for components
- Separate logic into custom hooks
- Max ~150 lines per component — extract if exceeded

## State Management
- Server state: TanStack Query (useQuery, useMutation)
- Simple client state: useState, useReducer
- Global client state: Zustand (when necessary)
- Context: only for themes, auth, i18n (values that change infrequently)
- NEVER prop drill > 2 levels

## Data Fetching
- TanStack Query for ALL API communication
- Appropriate staleTime (5min for data that changes infrequently)
- Cache invalidation after mutations
- Optimistic updates for smoother UX
- Error boundaries to catch render errors

## Hooks
- `use` prefix for custom hooks
- One hook per file
- Hooks should not have direct side effects (use useEffect)
- Rules of hooks: top level only, never conditional

## Styling
- Tailwind CSS (never CSS-in-JS or CSS modules)
- Mobile-first: start without prefix, add sm:, md:, lg:
- cn() (clsx + tailwind-merge) for conditional classes
- Extract component when classes > 5-6 utility classes

## Performance
- React.memo for pure components that re-render frequently
- useMemo/useCallback sparingly (only when the problem has been measured)
- Lazy loading for routes and heavy components
- Virtualization for long lists (> 100 items)
- Image optimization (next/image or lazy loading)

## Accessibility (a11y)
- Semantic HTML (header, main, nav, article, button, etc.)
- Labels on all inputs
- Alt text on images
- Functional keyboard navigation
- Adequate contrast (WCAG AA minimum)
- aria-* when semantic HTML is not sufficient
