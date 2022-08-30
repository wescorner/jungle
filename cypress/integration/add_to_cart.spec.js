/// <reference types="cypress" />

describe("jungle app add to cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("visits the home page", () => {
    cy.get(".title h1").should("have.text", "The Jungle");
  });
  it("adds to cart after clicking add button", () => {
    cy.get(".end-0 a").contains("0");
    cy.get(".btn").contains("Add").click({ force: true });
    cy.get(".end-0 a").contains("1");
  });
});
