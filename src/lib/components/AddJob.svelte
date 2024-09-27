<script lang="ts">
  // @ts-ignore
  import type { PageData } from "./$types"
	export let dialog: PageData
</script>

<dialog id="addJob" bind:this={dialog} on:close>
  <header>Job Adder</header>
  🧑‍💻<!--dropdown selector here-->
	<!-- Or maybe just use the currently selected user from +page -->
	<form class="jobForm" method="dialog">
		<label> Job Title
			<input name="title">
		</label>
		<label> 🏢 Company
			<input name="company">
		</label>
		<label> 📍 Location
			<input name="location">
		</label>
		<label> 🏡 Hybrid
			<input type="checkbox" name="isHybrid">
		</label>
		<label> 🚗 Distance
			<small>In kilometers</small>
			<input type="number" name="distance" disabled>
		</label>
		<button type="submit">Add</button>
	</form>
</dialog>
