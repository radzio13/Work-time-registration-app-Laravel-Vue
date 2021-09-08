<template>
    <div class="addWork">
        <input type="text" v-model="work.name" placeholder="Wpisz nazwę wykonywanego zadania"/>
        <button @click="addWork()" class="btn btn-primary" :disabled="!work.name.length">Dodaj</button>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            work: {
                name: ""
            }
        }
    },
    methods: {
        addWork() {
            if (this.work.name == '') {
                return;
            }

            axios.post('/work/store', {
                work: this.work
            })
            .then( response => {
                if (response.status == 201) {
                    this.work.name = "";
                    this.$emit('reloadlist');
                }
            })
            .catch (error => {
                console.log(error);
            })
        }
    }
}
</script>

<style scoped>

.addWork {
    display: flex;
    justify-content: center;
    align-items: center;
}

input {
    background: #f7f7f7;
    border: 0px;
    outline: none;
    padding: 5px;
    margin-right: 10px;
    width: 100%;
}

</style>