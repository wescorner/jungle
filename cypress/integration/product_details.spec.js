/// <reference types="cypress" />

describe("jungle app product page", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("visits the home page", () => {
    cy.get(".title h1").should("have.text", "The Jungle");
  });
  it("visits the product page after clicking the product", () => {
    cy.get("[alt='Scented Blade']").click();
    cy.get(".product-detail .quantity").should("exist");
  });
});
