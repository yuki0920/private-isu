import http from "k6/http";

import { check } from "k6";

import { parseHTML } from "k6/html";

import { url } from "./config.js";

import { getAccount } from "./accounts.js";

export default function() {
  const account = getAccount();
  const login_res = http.post(url("/login"), {
    account_name: account.account_name,
    password: account.password,
  });

  check(login_res, {
    "is status 200": (r) => r.status === 200,
  });

  const res = http.get(url("/@terra"));

  const doc = parseHTML(res.body);

  const token = doc.find("input[name=csrf_token]").attr("value");
  const post_id = doc.find("input[name=post_id]").attr("value");

  const comment_res = http.post(url("/comment"), {
    csrf_token: token,
    post_id: post_id,
    comment: "test comment",
  });

  check(comment_res, {
    "is status 200": (r) => r.status === 200,
  });
}
