"use strict";

const concat = require("concat-string");

exports.handler = (event, context, callback) => {
  try {
    const result = {
      result: event.a + event.b
    };
    callback(null, result);
  } catch (err) {
    callback(err);
  }
};
