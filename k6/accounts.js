import { SharedArray } from "k6/data";

const accounts = new SharedArray("accounts", function () {
  return JSON.parse(open("./accounts.json"));
});

export function getAccount() {
  const index = Math.floor(Math.random() * accounts.length);
  return accounts[index];
}
