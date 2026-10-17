# Whisk docs

The source for [docs.usewhisk.xyz](https://docs.usewhisk.xyz): guides, the SDK
reference and the API reference for Whisk, the stablecoin payments SDK.

## Status

Being set up. The Mintlify site, the port of the existing docs and the rewrite are
tracked in [the issues](https://github.com/usewhisk/docs/issues):

- [#1](https://github.com/usewhisk/docs/issues/1) Mintlify at `docs.usewhisk.xyz`;
- [#2](https://github.com/usewhisk/docs/issues/2) port the current docs out of
  `usewhisk/whisk`;
- [#3](https://github.com/usewhisk/docs/issues/3) rewrite for the new surfaces.

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
pnpm preflight
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
