import ButtonRequest from '../../resources/js/components/ButtonRequest.vue';
import { mount } from '@vue/test-utils';
import { mockData } from '../../resources/js/services/axios.js'
import flushPromises from 'flush-promises';

jest.mock('../../resources/js/services/axios.js'); 

describe('ButtonRequest', ()=>{
    test("Fetches data once the button is clicked", async ()=>{
        let wrapper = mount(ButtonRequest);
        mockData.mockResolvedValueOnce({ "data": 'value' });

        let btn = wrapper.find('button');
        btn.trigger('click');
        expect(mockData).toHaveBeenCalledTimes(1);

        await flushPromises();

        expect(btn.text()).toBe('value');
    })
});