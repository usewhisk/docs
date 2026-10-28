// Prints the chain table on reference/cctp/chains.mdx from the published registry:
//   npx -y -p @usewhisk/cctp@0.1.1 node scripts/gen-chains-table.mjs
// Set CCTP_ENTRY to a local build (packages/cctp/dist/index.js) to read that instead.
import { createRequire } from "node:module";
import { pathToFileURL } from "node:url";

async function loadCctp() {
  if (process.env.CCTP_ENTRY) {
    return import(pathToFileURL(process.env.CCTP_ENTRY).href);
  }
  // npx -p puts the package on PATH, not on this script's import path.
  const bin = process.env.PATH.split(":").find((p) => p.includes("_npx"));
  const require = createRequire(
    bin ? `${bin}/../package.json` : import.meta.url,
  );
  return import(pathToFileURL(require.resolve("@usewhisk/cctp")).href);
}

const { CHAINS } = await loadCctp();

const rows = [
  "| Id | Label | Ecosystem | Network | Domain | Fast source | USDC | Explorer |",
  "| --- | --- | --- | --- | --- | --- | --- | --- |",
];
for (const c of CHAINS) {
  rows.push(
    `| \`${c.id}\` | ${c.label} | ${c.ecosystem} | ${c.network} | ${c.cctpDomain} | ${c.capabilities.fastSource ? "yes" : "no"} | \`${c.usdc}\` | ${c.explorerUrl}${c.explorerQuery ?? ""} |`,
  );
}
console.log(rows.join("\n"));
