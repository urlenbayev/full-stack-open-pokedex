import { test, expect } from '@playwright/test'

test.describe('Pokedex', () => {
  test('front page can be opened', async ({ page }) => {
    await page.goto('http://localhost:8080')
    await expect(page.getByText('ivysaur')).toBeVisible()
    await expect(page.getByText('Pokémon and Pokémon character names are trademarks of Nintendo.')).toBeVisible()
  })
})

test.describe('Pokedex', () => {
  test('pokemon page can be navigated to', async ({ page }) => {
    await page.goto('http://localhost:8080/pokemon/parasect')
    await expect(page.getByText('parasect')).toBeVisible()
    await expect(page.getByText('damp')).toBeVisible()
    await expect(page.getByText('effect spore')).toBeVisible()
  })
})