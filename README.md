# Whisk docs

The source for [docs.usewhisk.xyz](https://docs.usewhisk.xyz): guides, the SDK
reference and the API reference for Whisk, the stablecoin payments SDK.

## Status

The site covers `@usewhisk/react` and `@usewhisk/core` 0.3.x and `@usewhisk/cctp` 0.1.x,
ported from the old `apps/docs` and rewritten against the published code. The API
reference tab arrives with the platform's OpenAPI spec.

## Run it locally

```bash
pnpm install
npx mint@4.2.993 dev   # http://localhost:3000
```

## How the site is built

- [Mintlify](https://mintlify.com), light appearance only.
- The API reference is generated from the platform's OpenAPI spec.
- Mintlify publishes `llms.txt` and an MCP search server, so coding agents can read
  the docs directly.

## Contributing

Fixes are welcome. A typo or a broken example is a pull request; a new page or a
restructure starts with an issue.

```bash
pnpm install   # installs the git hooks
pnpm preflight # format, shellcheck, Mintlify build, broken links
```

You also need `brew install gitleaks shellcheck`. Read the
[contributing guide](https://github.com/usewhisk/.github/blob/main/CONTRIBUTING.md)
first.

Writing rules:

- every page opens with a snippet that works when pasted;
- units are explicit: 6 decimals for USDC, 7 on Stellar, 18 for Arc's native gas;
- no em-dashes.

## License

MIT
