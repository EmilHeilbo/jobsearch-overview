<script lang="ts">
	import Job from '$lib/components/Job.svelte'
	import type { PageData } from './$types'
	let testVar = "Dynamic option"
	let testArr = ["Array", "Options", "Here"]
	export let data: PageData
</script>

<header>
	<h1>💼 Jobsearch Overview</h1>
</header>

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

<main style="padding: 1rem;">
	{#each data.jobs as job}
		<Job {job} />
	{/each}
</main>

<footer>
	<p>&copy;2024 – {data.users[0].name}</p>
	<small>
		Made with <a href="https://kit.svelte.dev">SvelteKit</a>, <a href="https://prisma.io">Prisma</a> & <a href="https://matcha.mizu.sh">matcha.css</a>
	</small>
</footer>

<style>
	a {
		color: #8ff0a4;
	}
	footer {
		padding: 0;
	}
	aside {
		padding-left: 1rem !important;
	}
</style>
