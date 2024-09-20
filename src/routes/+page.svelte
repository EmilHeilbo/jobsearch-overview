<script lang="ts">
	import Job from '$lib/components/Job.svelte'
	import type { PageData } from './$types'
	let dialog: { showModal: () => any; }
	export let data: PageData
</script>

<aside>
	<section>
		<h1>This is in the sidebar</h1>
		<label>
		  🧑‍💻 Job Applicant
			<select>
				{#each data.users as _}
					<option>{_.name}</option>
				{/each}
			</select>
		</label>
		<button class="variant" on:click={dialog.showModal()}>Add Job</button>
	</section>
</aside>

<main>
	{#each data.jobs as job}
		<Job {job} />
	{/each}
</main>
