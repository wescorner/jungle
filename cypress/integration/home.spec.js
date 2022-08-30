/// <reference types="cypress" />

describe("jungle app", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("visits the home page", () => {
    cy.get(".title h1").should("have.text", "The Jungle");
  });
  it("has products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("has 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
