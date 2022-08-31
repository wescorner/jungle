/// <reference types="cypress" />

describe("jungle app user login", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("visits the home page", () => {
    cy.get(".title h1").should("have.text", "The Jungle");
  });
  it("visits the login page after clicking login button", () => {
    cy.get(".nav-link").contains("Login").click();
    cy.get(".form-control").should("be.visible");
  });
  it("redirects to home page after successful login", () => {
    cy.get(".nav-link").contains("Login").click();
    cy.get("#email").type("newuser@email.com");
    cy.get("#password").type("password");
    cy.get("input[type='Submit']").click();
    cy.get("nav").contains("newuser@email.com").should("be.visible");
  });
  it("registers a user", () => {
    cy.get(".nav-link").contains("Signup").click();
    cy.get("#firstname").type("First");
    cy.get("#lastname").type("Last");
    cy.get("#email").type("user@gmail.com");
    cy.get("#password").type("password");
    cy.get("#password_confirmation").type("password");
    cy.get("input[type='Submit']").click();
    cy.get("nav").contains("user@gmail.com").should("be.visible");
  });
});
