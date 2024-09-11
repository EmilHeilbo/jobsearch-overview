<script>
	let testVar = "Dynamic option";
	let testArr = ["Array", "Options", "Here"];
</script>

<header>
	<h1>Welcome to SvelteKit</h1>
</header>

<main>
	<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
</main>

<aside>
	<section>
		<h1>This is in the sidebar</h1>
		<label>
			Big label
			<small>Small label</small>
			<select>
				<option>Static option</option>
				<option>{testVar}</option>
				{#each testArr as _}
					<option>{_}</option>
				{/each}
			</select>
		</label>
	</section>
</aside>

<footer>
	<p>&copy;2024 – Emil Heilbo</p>
	<small>
		Made with <a href="https://kit.svelte.dev">SvelteKit</a>, <a href="https://prisma.io">Prisma</a> & <a href="https://matcha.mizu.sh">matcha.css</a>
	</small>
</footer>


<style>
	a {
		color: #8ff0a4;
	}
</style>
